function main() {
  local pids;
  pids="$(aerospace list-apps | awk '{print $1}')";

  # shellcheck disable=SC2086
  kill -9 $pids;
}

main;
