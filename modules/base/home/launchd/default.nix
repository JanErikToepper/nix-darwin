{ config, pkgs, ... }: {
  launchd = {
    enable = true;
    agents = {
      bg = {
        enable = true;
        config = {
          Label = "toepper.bg";
          ProgramArguments = [
            "${pkgs.desktoppr}/bin/desktoppr"
            "/etc/nix-darwin/modules/base/assets/black-background.avif"
          ];
          RunAtLoad = true;
        };
      };
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
