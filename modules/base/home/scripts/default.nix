{ lib, config, ... }: {
  imports = [
    ./darwin-rebuild-switch
    ./kill-all-aerospace-windows
    ./patched-shutdown
    ./pull-nix-darwin-configuration
    ./push-nix-darwin-configuration
    ./stage-nix-darwin-configuration
  ];

  options.customScripts = lib.mkOption {
    type = lib.types.attrsOf lib.types.package;
  };

  config.home.packages = with config.customScripts; [
    darwin-rebuild-switch
    kill-all-aerospace-windows
    patched-shutdown
    push-nix-darwin-configuration
    stage-nix-darwin-configuration
  ];
}
