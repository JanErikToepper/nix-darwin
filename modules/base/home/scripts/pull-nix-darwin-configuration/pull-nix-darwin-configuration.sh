function main() {
  wait-until-online

  git -C /etc/nix-darwin pull --autostash --rebase
}

main
