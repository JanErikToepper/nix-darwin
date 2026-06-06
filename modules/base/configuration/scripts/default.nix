{ pkgs, ... }: {
  imports = [
    ./darwin-rebuild-switch
    ./pull-nix-darwin-configuration
    ./push-nix-darwin-configuration-and-shutdown
  ];

  environment.systemPackages = with pkgs; [
    darwin-rebuild-switch
    pull-nix-darwin-configuration
    push-nix-darwin-configuration-and-shutdown
  ];
}
