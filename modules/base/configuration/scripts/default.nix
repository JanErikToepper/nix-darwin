{ config, lib, ... }: {
  imports = [
    ./darwin-rebuild-switch
    ./watch-drs-watch
  ];

  options.customScripts = lib.mkOption {
    type = lib.types.attrsOf lib.types.package;
  }; 

  config.environment.systemPackages = with config.customScripts; [
    darwin-rebuild-switch
    watch-drs-watch
  ];
}
