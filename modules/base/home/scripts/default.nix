{ lib, config, ... }: {
  imports = [
    ./darwin-rebuild-switch
    ./kill-all-aerospace-windows
    ./pull-nix-darwin-configuration
    ./push-nix-darwin-configuration-and-shutdown
  ];

  options.customScripts = lib.mkOption {
    type = lib.types.attrsOf lib.types.package;
  };

  config.home.packages = with config.customScripts; [
    darwin-rebuild-switch
    kill-all-aerospace-windows
    pull-nix-darwin-configuration
    push-nix-darwin-configuration-and-shutdown 
  ];
}
