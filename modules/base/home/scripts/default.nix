{ config, ... }: {
  imports = [
    ./darwin-rebuild-switch
    ./kill-all-aerospace-windows
    ./pull-nix-darwin-configuration
    ./push-nix-darwin-configuration-and-shutdown
  ];

  home.packages = with config.customScripts; [
    darwin-rebuild-switch
    kill-all-aerospace-windows
    pull-nix-darwin-configuration
    push-nix-darwin-configuration-and-shutdown 
  ];
}
