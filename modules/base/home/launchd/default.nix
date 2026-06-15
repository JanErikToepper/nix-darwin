{ config, pkgs, ... }: {
  launchd = {
    enable = true;
    agents = {
      bg = {
        enable = true;
        config = {
          Label = "toepper.set-background";
          ProgramArguments = [
            "${pkgs.desktoppr}/bin/desktoppr"
            "/etc/nix-darwin/modules/base/assets/black-background.avif"
          ];
          RunAtLoad = true;
        };
      };
      pull-and-trigger = {
        enable = true;
        config = {
          Label = "toepper.pull-nix-darwin-configuration";
          ProgramArguments = [
            "${config.customScripts.pull-nix-darwin-configuration}/bin/pull-nix-darwin-configuration"
          ];
          RunAtLoad = true;
        };
      };
    };
  };
}
