function main() {
  git -C /etc/nix-darwin pull --rebase;

  darwin-rebuild-switch;
}

main
