{ pkgs, ... }: {
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
    };
  };
}
