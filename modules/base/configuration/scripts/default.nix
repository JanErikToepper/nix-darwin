{ ... }: {
  imports = [
    ./drs
    ./pull-nix-darwin-configuration
    ./push-nix-darwin-configuration-and-shutdown
  ];
}
