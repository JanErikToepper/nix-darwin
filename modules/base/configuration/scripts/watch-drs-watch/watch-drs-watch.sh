function main() {
  if [[ ! -f "/etc/nix-darwin/.watch/default" ]]; then
    exit 1;
  fi

  rm /etc/nix-darwin/.watch/default;
}

main;
