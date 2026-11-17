"""Skill step O on Bim!: make the client play against its own server on the same device, no internet.

Usage: python3 -I bim_offline.py <bim source dir> <port> [--keep-crash]
Three changes to the game's code, nothing else:
1. the default game server is this device (127.0.0.1:<port>) instead of bim.jorge.st;
2. when the sign-in ("business") server can't be reached, carry on as a local player and connect to
   the game server anyway (the original stops there: "It won't work but we'll still continue");
3. a crash fix that has nothing to do with offline: since upstream commit 317f199 (2026-11-11, clang-tidy
   modernize) the axmol scheduler bridge keeps a dangling reference to the callback ([&f] instead of a
   copy), so the first delayed call jumps through freed memory (SIGSEGV in
   delayed_call_manager::schedule_client_non_cumulated()'s lambda, or a hang on "Start: styles").
The server runs with enable_bots, so matchmaking gives a computer opponent.
4. the same server can also run inside the desktop client (BIM_LOCAL_SERVER=1): the plan for a phone,
   where no second program can be started. Client and server share iscool's scheduler (the game loop).
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
# Offline rebuild: no sign-in server, so play as a local player against the server on this device, with no
# error popup. Switchable with BIM_OFFLINE=1 so the lab can compare with the original behaviour in one build.
head = "void bim::axmol::app::main_task::business_server_connection_error(int status)\n{\n"
offline = ("  if (std::getenv(\"BIM_OFFLINE\"))\n    {\n"
           "      ic_log(iscool::log::nature::info(), \"main_task\", \"Offline: no sign-in server, local player.\");\n"
           "      m_session_token = \"offline\";\n      m_done_steps |= steps::business;\n"
           "      try_connect_to_game_server();\n      start_authenticated_jobs();\n      return;\n    }\n\n")
assert head in s, "business error handler head not found"
s = s.replace(head, head + offline)
if "#include <cstdlib>" not in s:
    s = "#include <cstdlib>\n" + s
open(p, "w").write(s)
p = f"{src}/modules/axmol/schedule/main/src/bim/axmol/schedule/bridge.cpp"
s = open(p).read()
bug = "      [&f](float)\n"
if bug in s:
    open(p, "w").write(s.replace(bug, "      [f](float)\n"))
    fix = "scheduler bridge copies the callback (upstream [&f] dangling reference)"
else:
    fix = "scheduler bridge already safe upstream"
if len(sys.argv) > 3 and sys.argv[3] == "--keep-crash":   # the ASan job proves the bug on the unfixed code
    open(p, "w").write(s)
    fix = "scheduler bridge left as upstream (--keep-crash)"
# 4. the game's own server inside the client (Linux app; the same code would go in an iPhone app)
p = f"{src}/apps/linux/main.cpp"
s = open(p).read()
s = s.replace("#include <bim/axmol/app/application.hpp>\n",
              "#include <bim/axmol/app/application.hpp>\n#include <bim/server/config.hpp>\n#include <bim/server/server.hpp>\n", 1)
run = "  const int result = axmol::Application::getInstance()->run();\n"
assert run in s, "linux main loop not found"
s = s.replace(run, (
    "  // Offline rebuild: the game's own server with bots inside this app, on the game loop.\n"
    "  static bim::server::config local_server_config;\n"
    "  std::optional<bim::server::server> local_server;\n"
    "  if (std::getenv(\"BIM_LOCAL_SERVER\"))\n    {\n"
    f"      local_server_config.port = {port};\n"
    "      local_server_config.enable_bots = true;\n"
    "      local_server_config.matchmaking_delay_for_bot = std::chrono::seconds(2);\n"
    "      local_server.emplace(local_server_config);\n"
    "      std::cout << \"Local game server with bots on port \" << local_server_config.port << \".\\n\";\n"
    "    }\n\n") + run, 1)
s = s.replace("  bridge.reset();\n", "  local_server.reset();\n  bridge.reset();\n", 1)
open(p, "w").write(s)
p = f"{src}/apps/linux/CMakeLists.txt"
s = open(p).read()
assert "  bim_axmol_app\n" in s
open(p, "w").write(s.replace("  bim_axmol_app\n", "  bim_axmol_app\n  bim_server\n", 1))
print(f"patched: game server 127.0.0.1:{port}, offline sign-in fallback, {fix}")
