bim ec33c22 2026-11-16, build asan
patched: game server 127.0.0.1:23899, offline sign-in fallback, scheduler bridge left as upstream (--keep-crash)
cache: same commit, only patched files are compiled
env exit 0
build exit 0
build/linux/asan/apps/linux/bim
build/linux/asan/apps/server/bim-server
internet: cut (curl to github.com fails)
[1m[I][0m[34m[server][0m Server is up on port 23899.
## plain start (no script): last lines
[I][StartUp] Start: audio.
[I][StartUp] Start: root scene.
[I][analytics_service] Event 'launched', language='en_GB'.
[I][StartUp] Business server is 'http://localhost:4210'.
[I][StartUp] Start: widgets.
[I][StartUp] Start: styles.
==16946==ERROR: AddressSanitizer: heap-use-after-free on address 0x7693f3399768 at pc 0x62713045fad6 bp 0x7fff12b0daf0 sp 0x7fff12b0dae0
SUMMARY: AddressSanitizer: heap-use-after-free /__w/apk-to-ipa-lab/apk-to-ipa-lab/bim/modules/axmol/schedule/main/src/bim/axmol/schedule/bridge.cpp:60 in operator()
asan-upstream exit 134
==16991==ERROR: AddressSanitizer: heap-use-after-free on address 0x79b24563ce68 at pc 0x58c196278ad6 bp 0x7fff7a1f4410 sp 0x7fff7a1f4400
READ of size 8 at 0x79b24563ce68 thread T0
    #0 0x58c196278ad5 in std::_Function_base::_M_empty() const /usr/include/c++/15/bits/std_function.h:249
    #1 0x58c196278ad5 in std::function<void ()>::operator()() const /usr/include/c++/15/bits/std_function.h:591
    #2 0x58c19662241b in operator() /__w/apk-to-ipa-lab/apk-to-ipa-lab/bim/modules/axmol/schedule/main/src/bim/axmol/schedule/bridge.cpp:60
    #3 0x58c196622498 in __invoke_impl<void, bim::axmol::schedule::bridge::schedule_call(const std::function<void()>&, const std::chrono::nanoseconds&)::<lambda(float)>&, float> /usr/include/c++/15/bits/invoke.h:63
    #4 0x58c196622516 in __invoke_r<void, bim::axmol::schedule::bridge::schedule_call(const std::function<void()>&, const std::chrono::nanoseconds&)::<lambda(float)>&, float> /usr/include/c++/15/bits/invoke.h:113
    #5 0x58c196622516 in _M_invoke /usr/include/c++/15/bits/std_function.h:292
    #6 0x58c19682b1c4 in std::function<void (float)>::operator()(float) const /usr/include/c++/15/bits/std_function.h:593
    #7 0x58c19682b1c4 in ax::TimerTargetCallback::trigger(float) /__w/apk-to-ipa-lab/apk-to-ipa-lab/bim/.backroom/packages/axmol/source/core//base/Scheduler.cpp:175
    #8 0x58c19686ba44 in ax::Timer::update(float) /__w/apk-to-ipa-lab/apk-to-ipa-lab/bim/.backroom/packages/axmol/source/core//base/Scheduler.cpp:99
    #9 0x58c1968dfa2b in ax::Scheduler::update(float) /__w/apk-to-ipa-lab/apk-to-ipa-lab/bim/.backroom/packages/axmol/source/core//base/Scheduler.cpp:799
    #10 0x58c1969ac2e9 in ax::Director::drawScene() /__w/apk-to-ipa-lab/apk-to-ipa-lab/bim/.backroom/packages/axmol/source/core//base/Director.cpp:301
    #11 0x58c1969ac494 in ax::Director::mainLoop() /__w/apk-to-ipa-lab/apk-to-ipa-lab/bim/.backroom/packages/axmol/source/core//base/Director.cpp:1629
    #12 0x58c1969ac494 in ax::Director::mainLoop() /__w/apk-to-ipa-lab/apk-to-ipa-lab/bim/.backroom/packages/axmol/source/core//base/Director.cpp:1611
    #13 0x58c1969ac577 in ax::Application::run() /__w/apk-to-ipa-lab/apk-to-ipa-lab/bim/.backroom/packages/axmol/source/core//platform/linux/Application-linux.cpp:74
    #14 0x58c196006cf5 in main /__w/apk-to-ipa-lab/apk-to-ipa-lab/bim/apps/linux/main.cpp:293
    #15 0x7d724661c600 in __libc_start_call_main ../sysdeps/nptl/libc_start_call_main.h:59
    #16 0x7d724661c717 in __libc_start_main_impl ../csu/libc-start.c:360
    #17 0x58c195e43024 in _start (/__w/apk-to-ipa-lab/apk-to-ipa-lab/bim/build/linux/asan/apps/linux/bim+0x35ec024) (BuildId: 3507d2ffeee4774d599e9b4e5814baef0157c9cb)

0x79b24563ce68 is located 24 bytes inside of 48-byte region [0x79b24563ce50,0x79b24563ce80)
freed by thread T0 here:
    #0 0x58c195f2bddb in operator delete(void*, unsigned long) (/__w/apk-to-ipa-lab/apk-to-ipa-lab/bim/build/linux/asan/apps/linux/bim+0x36d4ddb) (BuildId: 3507d2ffeee4774d599e9b4e5814baef0157c9cb)
    #1 0x58c19662081f in _M_destroy /usr/include/c++/15/bits/std_function.h:177
    #2 0x58c196621230 in _M_manager /usr/include/c++/15/bits/std_function.h:205
    #3 0x58c1966214bb in _M_manager /usr/include/c++/15/bits/std_function.h:284
    #4 0x58c1968df965 in std::_Function_base::~_Function_base() /usr/include/c++/15/bits/std_function.h:246
    #5 0x58c1968df965 in std::function<void ()>::~function() /usr/include/c++/15/bits/std_function.h:336
    #6 0x58c1968df965 in void std::destroy_at<std::function<void ()> >(std::function<void ()>*) /usr/include/c++/15/bits/stl_construct.h:88
    #7 0x58c1968df965 in void std::_Destroy<std::function<void ()> >(std::function<void ()>*) /usr/include/c++/15/bits/stl_construct.h:164
fix rebuild exit 0
client A exit 1; screenshots: 1-lobby-offline.png 
## run A (BIM_OFFLINE=unset)
[I][StartUp] Business server is 'http://localhost:4210'.
[I][script_director] Wait 'loaded'.
[I][main_task] Device ID is '62e4ba1d-120d-4e76-b7e8-6c345dd58cf3'.
[I][authenticate_with_business_job] Connecting to business server at 'http://localhost:4210'.
[E][authenticate_with_business_job] Failed to connect to the business server (-1): .
[I][analytics_service] Event 'error', cause='business-authentication'.
[E][business_interface] Request failed for 'http://localhost:4210/client/transfer-legacy-inventory': -1, .
[I][analytics_service] Event 'error', cause='push-legacy'.
[E][business_interface] Request failed for 'http://localhost:4210/client/me': -1, .
[I][analytics_service] Event 'error', cause='fetch-player-profile'.
[I][script_director] Capture '1-lobby-offline.png'.
[I][script_director] Click 'main/screen-wheel/lobby/play_button', wait 'players-ready-2'.
[I][script_director] Click 'main/screen-wheel/lobby/play_button', at (540, 1665).
[I][analytics_service] Event 'error', cause='products-detail'.
[E][script_director] Timeout while waiting for event 'players-ready-2'.
client B exit 0; screenshots: 1-lobby-offline.png 2-matched-with-bot.png 3-in-game.png 4-game-over.png 5-back-in-lobby.png 
## run B (BIM_OFFLINE=1)
[E][authenticate_with_business_job] Failed to connect to the business server (-1): .
[I][analytics_service] Event 'error', cause='business-authentication'.
[I][main_task] Offline: no sign-in server, local player.
[I][main_task] Connecting to game server at '127.0.0.1:23899'.
[E][business_interface] Request failed for 'http://localhost:4210/client/transfer-legacy-inventory': -1, .
[I][analytics_service] Event 'error', cause='push-legacy'.
[E][business_interface] Request failed for 'http://localhost:4210/client/me': -1, .
[I][analytics_service] Event 'error', cause='fetch-player-profile'.
[I][script_director] Capture '1-lobby-offline.png'.
[I][script_director] Click 'main/screen-wheel/lobby/play_button', wait 'players-ready-2'.
[I][script_director] Click 'main/screen-wheel/lobby/play_button', at (540, 1665).
[I][analytics_service] Screen 'matchmaking'.
[I][analytics_service] Event 'error', cause='products-detail'.
[I][script_director] Capture '2-matched-with-bot.png'.
[I][script_director] Click 'main/screen-wheel/matchmaking/ready_button', wait 'game-started'.
[I][script_director] Click 'main/screen-wheel/matchmaking/ready_button', at (540, 1687.2).
[I][script_director] Capture '3-in-game.png'.
[I][script_director] Click 'main/screen-wheel/online_game/bomb_button', wait 'end-game-ready'.
[I][script_director] Click 'main/screen-wheel/online_game/bomb_button', at (302.4, 1755.7566).
[E][business_interface] Request failed for 'http://localhost:4210/client/game/consume-reward': -1, .
[I][analytics_service] Event 'error', cause='game-reward'.
[I][script_director] Capture '4-game-over.png'.
[I][script_director] Click 'main/screen-wheel/end_game/quit_button', wait 'lobby-ready'.
[I][script_director] Click 'main/screen-wheel/end_game/quit_button', at (140.4, 2109).
[I][script_director] Capture '5-back-in-lobby.png'.
client C exit 0; screenshots: 1-lobby-offline.png 2-matched-with-bot.png 3-in-game.png 4-game-over.png 5-back-in-lobby.png 
## run C (server inside the client)
[I][analytics_service] Event 'error', cause='push-legacy'.
[E][business_interface] Request failed for 'http://localhost:4210/client/me': -1, .
[I][analytics_service] Event 'error', cause='fetch-player-profile'.
[I][session_service] Attach session 1 to token 9607329416577013163, id=0, country_code=UNK, country='Unknown', session_token=offline.
[I][script_director] Capture '1-lobby-offline.png'.
[I][script_director] Click 'main/screen-wheel/lobby/play_button', wait 'players-ready-2'.
[I][script_director] Click 'main/screen-wheel/lobby/play_button', at (540, 1665).
[I][analytics_service] Screen 'matchmaking'.
[I][analytics_service] Event 'error', cause='products-detail'.
[I][matchmaking_service] Creating new encounter 1 on request of session 1.
[I][matchmaking_service] Refreshing encounter 1 with 1 players on request of session 1.
[I][matchmaking_service] Last message repeated 1 time(s).
[I][script_director] Capture '2-matched-with-bot.png'.
[I][script_director] Click 'main/screen-wheel/matchmaking/ready_button', wait 'game-started'.
[I][script_director] Click 'main/screen-wheel/matchmaking/ready_button', at (540, 1687.2).
[I][matchmaking_service] Channel for encounter 1 is 1, seed 18301848765998365067, features=0, bot=true.
[I][script_director] Capture '3-in-game.png'.
[I][script_director] Click 'main/screen-wheel/online_game/bomb_button', wait 'end-game-ready'.
[I][script_director] Click 'main/screen-wheel/online_game/bomb_button', at (302.4, 1755.7566).
[E][business_interface] Request failed for 'http://localhost:4210/client/game/consume-reward': -1, .
[I][analytics_service] Event 'error', cause='game-reward'.
[I][script_director] Capture '4-game-over.png'.
[I][script_director] Click 'main/screen-wheel/end_game/quit_button', wait 'lobby-ready'.
[I][script_director] Click 'main/screen-wheel/end_game/quit_button', at (140.4, 2109).
[I][script_director] Capture '5-back-in-lobby.png'.
## server
[I][session_service] Attach session 1 to token 13539819955791338827, id=0, country_code=UNK, country='Unknown', session_token=offline.
[I][random_game_encounter_service] Trying to add session 1 in existing encounter.
[I][matchmaking_service] Creating new encounter 1 on request of session 1.
[I][matchmaking_service] Refreshing encounter 1 with 1 players on request of session 1.
[I][random_game_encounter_service] Accepted game. Session 1, encounter 1.
[I][game_service] Creating new game 1 for 2 players.
[I][matchmaking_service] Channel for encounter 1 is 1, seed 3315686128815646986, features=0, bot=true.
[I][game_service] Channel 1 all players ready, session 1.
[I][game_service] Last message repeated 1 time(s).
[I][game_service] Game over, game_id=1, winner_index=1, winner_session=2147483648, ticks=236, duration=4s, short=false.
