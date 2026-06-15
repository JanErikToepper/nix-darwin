{ lib, config, ... }: {
  imports = [
    ./kill-all-aerospace-windows
    ./push-nix-darwin-configuration-and-shutdown
  ];

  options.customScripts = lib.mkOption {
    type = lib.types.attrsOf lib.types.package;
  };

  config.home.packages = with config.customScripts; [
    kill-all-aerospace-windows
    push-nix-darwin-configuration-and-shutdown 
  ];
}
