{ ... }:
let
  customConfig = {
    user = "toepper";
    machine = "private";
  };
in
{
  imports = [ ./configuration ];

  config = {
    inherit (customConfig) user machine;

    home-manager.users.toepper = {
      imports = [ ./home ];

      config = customConfig;
    };
  };
}
