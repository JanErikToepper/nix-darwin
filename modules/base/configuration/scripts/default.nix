{ config, lib, ... }: {
  imports = [
    ./darwin-rebuild-switch
    ./pull-nix-darwin-configuration
  ];

  options.customScripts = lib.mkOption {
    type = lib.types.attrsOf lib.types.package;
  }; 

  config.environment.systemPackages = with config.customScripts; [
    darwin-rebuild-switch
    pull-nix-darwin-configuration
  ];
}
