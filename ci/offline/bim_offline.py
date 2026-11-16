"""Skill step O on Bim!: make the client play against its own server on the same device, no internet.

Usage: python3 -I bim_offline.py <bim source dir> <port>
Two changes to the game's code, nothing else:
1. the default game server is this device (127.0.0.1:<port>) instead of bim.jorge.st;
2. when the sign-in ("business") server can't be reached, carry on as a local player and connect to
   the game server anyway (the original stops there: "It won't work but we'll still continue").
The server runs with enable_bots, so matchmaking gives a computer opponent.
"""
import re, sys

src, port = sys.argv[1], sys.argv[2]
p = f"{src}/modules/bim/app/main/src/bim/app/config.cpp"
s = open(p).read()
s2 = re.sub(r'game_server\("bim\.jorge\.st:"\s*\+\s*std::to_string\([^()]*\)\)', f'game_server("127.0.0.1:{port}")', s, count=1, flags=re.S)
assert s2 != s, "config default not found"
open(p, "w").write(s2)
p = f"{src}/apps/axmol/main/src/bim/axmol/app/task/main_task.cpp"
s = open(p).read()
old = "  // It won't work but we'll still continue toward opening the main screen.\n  start_authenticated_jobs();"
new = ("  // Offline rebuild: no sign-in server, so play as a local player against the server on this device.\n"
       "  m_session_token = \"offline\";\n  m_done_steps |= steps::business;\n  try_connect_to_game_server();\n"
       "  start_authenticated_jobs();")
assert old in s, "business error handler not found"
open(p, "w").write(s.replace(old, new))
print(f"patched: game server 127.0.0.1:{port}, offline sign-in fallback")
