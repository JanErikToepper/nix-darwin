{ config, lib, ... }:
let
  customOptions = {
    user = lib.mkOption {
      type = lib.types.str;
    };
    machine = lib.mkOption {
      type = lib.types.enum [
        "private"
        "work"
      ];
    };
  };
in
{
  imports = [ ./configuration ];

  options = customOptions;

  config.home-manager.users.${config.user} = {
    imports = [ ./home ];

    options = customOptions;
  };
}
