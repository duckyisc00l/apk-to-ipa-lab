#!/bin/bash
# Diagnostic only (not part of a normal build): log which game controllers libGDX sees, to learn why SPD shows its
# "Controller Input" dialog in the simulator.
f=$(find "$1" -name ControllerHandler.java | head -1)
python3 - "$f" <<'P'
import sys
p=sys.argv[1]; s=open(p).read()
s=s.replace("public static boolean isControllerConnected(){\n\t\treturn controllersSupported() && Controllers.getCurrent() != null;",
"public static boolean isControllerConnected(){\n\t\tif (controllersSupported() && !labLogged){ labLogged = true; try { for (Controller c : Controllers.getControllers()) com.badlogic.gdx.Gdx.app.log(\"lab-diag\", \"controller: \" + c.getName() + \" id=\" + c.getUniqueId()); com.badlogic.gdx.Gdx.app.log(\"lab-diag\", \"controllers: \" + Controllers.getControllers().size + \", current: \" + Controllers.getCurrent()); } catch (Throwable t) { com.badlogic.gdx.Gdx.app.log(\"lab-diag\", \"controller list failed \" + t); } }\n\t\treturn controllersSupported() && Controllers.getCurrent() != null;")
s=s.replace("private static boolean initialized = false;","private static boolean labLogged = false;\n\tprivate static boolean initialized = false;",1)
open(p,'w').write(s); print("patched", p, "lab-diag" in s)
P
