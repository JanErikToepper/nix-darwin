{ config, pkgs, ... }: {
  launchd = {
    enable = true;
    agents = {
      set-background = {
        enable = true;
        config = {
          Label = "toepper.set-background";
          ProgramArguments = [
            "${pkgs.desktoppr}/bin/desktoppr"
            "/etc/nix-darwin/modules/base/assets/black-background.jpg"
          ];
          RunAtLoad = true;
          UserName = config.user;
        };
      };
      pull-nix-darwin-configuration = {
        enable = true;
        config = {
          Label = "toepper.pull-nix-darwin-configuration";
          ProgramArguments = [
            "${config.customScripts.pull-nix-darwin-configuration}/bin/pull-nix-darwin-configuration"
          ];
          RunAtLoad = true;
          UserName = config.user;
        };
      };
    };
  };
}
