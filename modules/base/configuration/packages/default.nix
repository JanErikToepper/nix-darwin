{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    drs
    iterm2
    pull-nix-darwin-configuration
    push-nix-darwin-configuration-and-shutdown
  ];
}
