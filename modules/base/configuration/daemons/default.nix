{ pkgs, ... }: {
  launchd.daemons = {
    sync = {
      command = "${pkgs.pull-nix-darwin-configuration}/bin/pull-nix-darwin-configuration";
      serviceConfig = {
        RunAtLoad = true;
      };
    };
  };
}
