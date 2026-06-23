function main() {
  darwin-rebuild switch --flake "/etc/nix-darwin#$MACHINE";
}

main;
