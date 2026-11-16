bim 3f54ca7 2026-11-14
272:  , game_server("bim.jorge.st:"
273-                + std::to_string(20000 + bim::version_major * 100
274-                                 + bim::net::protocol_version))
63:set(BIM_BUSINESS_SERVER_URL
64-  ${bim_business_server_url}
65-  CACHE
66-  STRING
67-  "URL of the business server targeted by this build."
--
70:message(STATUS "Business server is '${BIM_BUSINESS_SERVER_URL}'.")
71-
72-if(BIM_TARGET STREQUAL "android")
73-  set(BIM_ANDROID_GENERATED_RES_DIR
env exit 0
build exit 0
build/linux/release/apps/linux/bim
build/linux/release/apps/server/bim-server
UNCONN 0      0            0.0.0.0:23899      0.0.0.0:*    users:(("bim-server",pid=123821,fd=6))
123821 bim/build/linux/release/apps/server/bim-server --console-log --config server.cfg
[1m[I][0m[34m[server][0m Stack trace dumper is [31m'/__w/apk-to-ipa-lab/apk-to-ipa-lab/bim/build/linux/release/apps/server/bim-stack-dump'[0m.
[1m[I][0m[34m[server][0m Bim! 18.
[1m[I][0m[34m[server][0m Business is https://bim-prod.jorge.st.
[1m[I][0m[34m[server][0m Running on port 23899.
[1m[I][0m[34m[business_registration_service][0m Disabled.
[1m[I][0m[34m[discord_publisher_service][0m Disabled.
[1m[I][0m[34m[server][0m Server is up on port 23899.
[1m[I][0m[34m[server][0m Protocol version is 14.
