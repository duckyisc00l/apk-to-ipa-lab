bim ec33c22 2026-11-16, build release
patched: game server 127.0.0.1:23899, offline sign-in fallback, scheduler bridge copies the callback (upstream [&f] dangling reference)
cache: same commit, only patched files are compiled
env exit 0
build exit 0
build/linux/release/apps/linux/bim
build/linux/release/apps/server/bim-server
internet: cut (curl to github.com fails)
[1m[I][0m[34m[server][0m Server is up on port 23899.
## plain start (no script): last lines
[I][analytics_service] Event 'error', cause='push-legacy'.
[I][fetch_player_profile_job] Fetching the player's profile.
[E][business_interface] Request failed for 'https://bim-prod.jorge.st/client/me': -1, .
[E][fetch_player_profile_job] Failed to fetch the player's profile.
[I][analytics_service] Event 'error', cause='fetch-player-profile'.
[I][authentication_exchange] Authentication OK, session=1
[I][analytics_service] Event 'error', cause='products-detail'.
[E][shop_service] Could not fetch the products detail.
client A exit 124; screenshots: 1-lobby-offline.png 
## run A (BIM_OFFLINE=unset)
warning: Error disabling address space randomization: Operation not permitted
[I][StartUp] Business server is 'https://bim-prod.jorge.st'.
[I][script_director] Wait 'loaded'.
[I][main_task] Device ID is '96b06471-4b2e-4de9-98ed-168b92db1374'.
[I][authenticate_with_business_job] Connecting to business server at 'https://bim-prod.jorge.st'.
[E][authenticate_with_business_job] Failed to connect to the business server (-1): .
[I][analytics_service] Event 'error', cause='business-authentication'.
[E][business_interface] Request failed for 'https://bim-prod.jorge.st/client/transfer-legacy-inventory': -1, .
[I][analytics_service] Event 'error', cause='push-legacy'.
[E][business_interface] Request failed for 'https://bim-prod.jorge.st/client/me': -1, .
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
[E][business_interface] Request failed for 'https://bim-prod.jorge.st/client/transfer-legacy-inventory': -1, .
[I][analytics_service] Event 'error', cause='push-legacy'.
[E][business_interface] Request failed for 'https://bim-prod.jorge.st/client/me': -1, .
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
[E][business_interface] Request failed for 'https://bim-prod.jorge.st/client/game/consume-reward': -1, .
[I][analytics_service] Event 'error', cause='game-reward'.
[I][script_director] Capture '4-game-over.png'.
[I][script_director] Click 'main/screen-wheel/end_game/quit_button', wait 'lobby-ready'.
[I][script_director] Click 'main/screen-wheel/end_game/quit_button', at (140.4, 2109).
[I][script_director] Capture '5-back-in-lobby.png'.
client C exit 0; screenshots: 1-lobby-offline.png 2-matched-with-bot.png 3-in-game.png 4-game-over.png 5-back-in-lobby.png 
## run C (server inside the client)
[E][business_interface] Request failed for 'https://bim-prod.jorge.st/client/me': -1, .
[I][analytics_service] Event 'error', cause='fetch-player-profile'.
[I][session_service] Attach session 1 to token 2084067172897845545, id=0, country_code=UNK, country='Unknown', session_token=offline.
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
[I][matchmaking_service] Refreshing encounter 1 with 1 players on request of session 1.
[I][matchmaking_service] Channel for encounter 1 is 1, seed 18301848765998365067, features=0, bot=true.
[I][script_director] Capture '3-in-game.png'.
[I][script_director] Click 'main/screen-wheel/online_game/bomb_button', wait 'end-game-ready'.
[I][script_director] Click 'main/screen-wheel/online_game/bomb_button', at (302.4, 1755.7566).
[E][business_interface] Request failed for 'https://bim-prod.jorge.st/client/game/consume-reward': -1, .
[I][analytics_service] Event 'error', cause='game-reward'.
[I][script_director] Capture '4-game-over.png'.
[I][script_director] Click 'main/screen-wheel/end_game/quit_button', wait 'lobby-ready'.
[I][script_director] Click 'main/screen-wheel/end_game/quit_button', at (140.4, 2109).
[I][script_director] Capture '5-back-in-lobby.png'.
## server
[I][session_service] Attach session 1 to token 10138335176675771662, id=0, country_code=UNK, country='Unknown', session_token=offline.
[I][session_service] Disconnected 1.
[I][session_service] Session clean up 1 -> 0.
[I][session_service] Attach session 2 to token 6695155851248006516, id=0, country_code=UNK, country='Unknown', session_token=offline.
[I][random_game_encounter_service] Trying to add session 2 in existing encounter.
[I][matchmaking_service] Creating new encounter 1 on request of session 2.
[I][matchmaking_service] Refreshing encounter 1 with 1 players on request of session 2.
[I][random_game_encounter_service] Accepted game. Session 2, encounter 1.
[I][game_service] Creating new game 1 for 2 players.
[I][matchmaking_service] Channel for encounter 1 is 1, seed 9738221063587185541, features=0, bot=true.
[I][game_service] Channel 1 all players ready, session 2.
[I][game_service] Last message repeated 1 time(s).
[I][game_service] Game over, game_id=1, winner_index=1, winner_session=2147483648, ticks=234, duration=4s, short=false.
