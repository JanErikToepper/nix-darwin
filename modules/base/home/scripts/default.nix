{ lib, config, ... }: {
  imports = [
    ./darwin-rebuild-switch
    ./hurl-init
    ./kill-all-aerospace-windows
    ./patched-shutdown
    ./pull-nix-darwin-configuration
    ./push-nix-darwin-configuration
    ./spring-init
    ./stage-nix-darwin-configuration
    ./watch
  ];

  options.customScripts = lib.mkOption {
    type = lib.types.attrsOf lib.types.package;
  };

  config.home.packages = with config.customScripts; [
    darwin-rebuild-switch
    hurl-init
    kill-all-aerospace-windows
    patched-shutdown
    pull-nix-darwin-configuration
    push-nix-darwin-configuration
    spring-init
    stage-nix-darwin-configuration
    watch
  ];
}
