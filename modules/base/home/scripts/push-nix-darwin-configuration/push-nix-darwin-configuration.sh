function main() {
  git -C /etc/nix-darwin add --all .;

  if ! git -C /etc/nix-darwin diff-index --quiet HEAD; then
    local timestamp;
    timestamp="$(date +"%Y-%m-%d - %H:%M:%S")";

    git -C /etc/nix-darwin commit -m "[$MACHINE] $timestamp";
    git -C /etc/nix-darwin push;
  fi
}

main;
