{ lib, ... }: {
  imports = [ ./configuration ];

  options.machine = lib.mkOption {
    type = lib.types.enum [ "private" "work" ]; 
  };

  config.home-manager.users.toepper = {
    imports = [ ./home ];

    options.machine = lib.mkOption {
      type = lib.types.enum [ "private" "work" ]; 
    };
  };
}
