{ lib, config, ... }: {
  imports = [
    ./answer
    ./ask
    ./darwin-rebuild-switch
    ./hurl-init
    ./pull-nix-darwin-configuration
    ./push-nix-darwin-configuration
    ./spring-init
    ./stage-nix-darwin-configuration
    ./wait-until-online
    ./watch
  ];

  options.customScripts = lib.mkOption {
    type = lib.types.attrsOf lib.types.package;
  };

  config.home.packages = with config.customScripts; [
    answer
    ask
    darwin-rebuild-switch
    hurl-init
    pull-nix-darwin-configuration
    push-nix-darwin-configuration
    spring-init
    stage-nix-darwin-configuration
    wait-until-online
    watch
  ];
}
