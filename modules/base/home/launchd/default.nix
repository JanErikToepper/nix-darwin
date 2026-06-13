{ config, ... }: {
  launchd = {
    enable = true;
    agents = {
      sync = {
        enable = true; 
        config = {
          Label = "toepper.sync"; 
          Program = "${config.customScripts.pull-nix-darwin-configuration}/bin/pull-nix-darwin-configuration";
          RunAtLoad = true;
        };
      }; 
    };
  };
}
