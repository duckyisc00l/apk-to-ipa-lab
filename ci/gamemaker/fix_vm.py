"""Runner fixes that every platform needs (Linux lab and iPhone): small text edits that fail loudly if the code moved.

Usage: python3 -I ci/gamemaker/fix_vm.py <engine dir>
1. A negative first index in a 2-D array read (a[-1][j]) crashed the runner (null slot). GameMaker throws
   "index out of range" there, which a try/catch in the game catches (Legendary Chess's shield check reads
   current_state[row - 1][col - 1] inside try). Throw the same way and push undefined.
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
print("fix_vm: negative array index throws instead of crashing (2 places)")
