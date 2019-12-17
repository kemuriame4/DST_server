#!/bin/bash
steamcmd_dir="$HOME/steamcmd"
install_dir="$HOME/DSTserver"
cluster_name="DST_MAIN"
cd "$install_dir/bin"

run_shared=(./dontstarve_dedicated_server_nullrenderer)
run_shared+=(-console)
run_shared+=(-cluster "DST_MAIN")
run_shared+=(-monitor_parent_process $$)

"${run_shared[@]}" -shard Master | sed 's/^/Master: /' &
"${run_shared[@]}" -shard Caves  | sed 's/^/Caves: /'