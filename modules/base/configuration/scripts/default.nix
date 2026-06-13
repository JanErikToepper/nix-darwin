{ pkgs, ... }: {
  imports = [
    ./darwin-rebuild-switch
    ./kill-all-aerospace-windows
    ./pull-nix-darwin-configuration
    ./push-nix-darwin-configuration-and-shutdown
  ];

  environment.systemPackages = with pkgs; [
    darwin-rebuild-switch
    kill-all-aerospace-windows
    pull-nix-darwin-configuration
    push-nix-darwin-configuration-and-shutdown
  ];
}
