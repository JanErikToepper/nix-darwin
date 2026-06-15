{ lib, config, ... }: {
  imports = [
    ./darwin-rebuild-switch
    ./kill-all-aerospace-windows
    ./patched-shutdown
    ./pull-nix-darwin-configuration
    ./pull-nix-darwin-configuration-and-trigger-drs-watch
    ./push-nix-darwin-configuration
    ./trigger-drs-watch
  ];

  options.customScripts = lib.mkOption {
    type = lib.types.attrsOf lib.types.package;
  };

  config.home.packages = with config.customScripts; [
    darwin-rebuild-switch
    kill-all-aerospace-windows
    patched-shutdown
    pull-nix-darwin-configuration
    pull-nix-darwin-configuration-and-trigger-drs-watch
    push-nix-darwin-configuration
    trigger-drs-watch
  ];
}
