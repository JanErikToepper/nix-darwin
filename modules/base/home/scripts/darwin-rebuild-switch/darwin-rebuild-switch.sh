function main() {
  git -C /etc/nix-darwin add --all .;

  darwin-rebuild switch --flake "/etc/nix-darwin#$MACHINE";
}

main
