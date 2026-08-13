function main() {
  git -C /etc/nix-darwin pull --autostash --rebase
}

main
