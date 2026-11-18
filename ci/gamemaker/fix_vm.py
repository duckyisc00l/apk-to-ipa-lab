"""Runner fixes that every platform needs (Linux lab and iPhone): small text edits that fail loudly if the code moved.

Usage: python3 -I ci/gamemaker/fix_vm.py <engine dir>
1. A negative first index in a 2-D array read (a[-1][j]) crashed the runner (null slot). GameMaker throws
   "index out of range" there, which a try/catch in the game catches (Legendary Chess's shield check reads
   current_state[row - 1][col - 1] inside try). Throw the same way and push undefined.
2. variable_clone only added a reference, so the copy shared its inner arrays with the original. GameMaker
   copies arrays and structs all the way down (Legendary Chess keeps its undo history that way: Reset and
   Undo did nothing). Copy them deeply.
"""
import pathlib, sys

vm = pathlib.Path(sys.argv[1]) / "src" / "vm.c"
t = vm.read_text()

def edit(old, new):
    global t
    if t.count(old) != 1:
        sys.exit(f"fix_vm: '{old[:70]}' found {t.count(old)} times, expected 1")
    t = t.replace(old, new)

THROW = ('        VMException* exception = (VMException*) safeCalloc(1, sizeof(VMException));\n'
         '        exception->message = safeStrdup("Array index out of range (negative index)");\n'
         '        ctx->exception = exception;\n')
# ARRAYPUSHAF / POPAF first step
edit("                GMLArray* top = slot->array;\n                GMLArray_growTo(top, firstIndex + 1);",
     "                if (0 > firstIndex) {\n" + THROW.replace("        ", "                    ", 3) +
     "                    stackPush(ctx, RValue_makeUndefined());\n                    break;\n                }\n"
     "                GMLArray* top = slot->array;\n                GMLArray_growTo(top, firstIndex + 1);")
# BREAK_PUSHAC (deeper steps)
edit("    GMLArray* parent = arrayRef.array;\n    GMLArray_growTo(parent, idx + 1);",
     "    if (0 > idx) {\n" + THROW.replace("        ", "        ", 3) +
     "        stackPush(ctx, RValue_makeUndefined());\n        RValue_free(&arrayRef);\n        return;\n    }\n"
     "    GMLArray* parent = arrayRef.array;\n    GMLArray_growTo(parent, idx + 1);")
vm.write_text(t)

bi = pathlib.Path(sys.argv[1]) / "src" / "vm_builtins.c"
t = bi.read_text()
old = """static RValue builtin_variable_clone(MAYBE_UNUSED VMContext* ctx, RValue* args, int32_t argCount) {
    REQUIRE_ARGC_AT_LEAST("variable_clone", 1, RValue_makeUndefined());
    return RValue_makeIndependent(args[0]);
}"""
new = """static RValue deepCloneValue(VMContext* ctx, RValue v, int32_t depth) {
    if (depth <= 0) return RValue_makeIndependent(v);
    if (v.type == RVALUE_ARRAY && v.array != nullptr) {
        GMLArray* src = v.array;
        GMLArray* dst = GMLArray_clone(src, ctx->currentArrayOwner);
        if (dst->type == GML_LEGACY_ARRAY) {
            for (int32_t r = 0; r < dst->legacy.rowCount; r++)
                for (int32_t c = 0; c < dst->legacy.rows[r].length; c++) {
                    RValue* cell = &dst->legacy.rows[r].data[c];
                    if (cell->type == RVALUE_ARRAY || cell->type == RVALUE_STRUCT) {
                        RValue deep = deepCloneValue(ctx, *cell, depth - 1); RValue_free(cell); *cell = deep; }
                }
        } else {
            for (int32_t i = 0; i < dst->modern.length; i++) {
                RValue* cell = &dst->modern.data[i];
                if (cell->type == RVALUE_ARRAY || cell->type == RVALUE_STRUCT) {
                    RValue deep = deepCloneValue(ctx, *cell, depth - 1); RValue_free(cell); *cell = deep; }
            }
        }
        RValue out = RValue_makeArray(dst);
        out.ownsReference = true;
        return out;
    }
    if (v.type == RVALUE_STRUCT && v.structInst != nullptr) {
        Instance* src = v.structInst;
        Instance* dst = Runner_createStruct(ctx->runner);
        for (uint32_t i = 0; i < src->selfVars.capacity; i++) {
            IntRValueEntry* e = &src->selfVars.entries[i];
            if (e->key == INT_RVALUE_HASHMAP_EMPTY_KEY) continue;
            RValue* slot = IntRValueHashMap_getOrInsertUndefined(&dst->selfVars, e->key);
            *slot = deepCloneValue(ctx, e->value, depth - 1);
        }
        RValue out = RValue_makeStructWeak(dst);
        out.ownsReference = true;   // Runner_createStruct already counted this reference
        return out;
    }
    return RValue_makeIndependent(v);
}

static RValue builtin_variable_clone(MAYBE_UNUSED VMContext* ctx, RValue* args, int32_t argCount) {
    REQUIRE_ARGC_AT_LEAST("variable_clone", 1, RValue_makeUndefined());
    return deepCloneValue(ctx, args[0], argCount > 1 ? RValue_toInt32(args[1]) : 128);
}"""
if t.count(old) != 1:
    sys.exit("fix_vm: variable_clone moved")
bi.write_text(t.replace(old, new))
print("fix_vm: negative array index throws instead of crashing (2 places); variable_clone copies deeply")
