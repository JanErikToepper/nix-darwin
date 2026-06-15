{ config, ... }: let
  customConfig = {
    user = "janeriktoepper";
    machine = "work";
  };
in {
  imports = [ ./configuration ];

  config = {
    inherit (customConfig) user machine;

    home-manager.users.${config.user} = {
      imports = [ ./home ];

      config = customConfig;
    };
  };
}
