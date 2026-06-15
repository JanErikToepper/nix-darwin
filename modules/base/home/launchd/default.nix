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
            "/etc/nix-darwin/modules/base/assets/black-background.avif"
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
            "${config.customScripts.pull-nix-darwin-configuration-and-trigger-drs-watch}/bin/pull-nix-darwin-configuration-and-trigger-drs-watch"
          ];
          StandardErrorPath = /Users/toepper/error.log;
          StandardOutPath = /Users/toepper/out.log;
          RunAtLoad = true;
          UserName = config.user;
        };
      };
    };
  };
}
