{ config, ... }: {
  launchd.daemons = {
    sync = {
      command = "${config.customScripts.pull-nix-darwin-configuration}/bin/pull-nix-darwin-configuration";
      serviceConfig = {
        RunAtLoad = true;
      };
    };
  };
}
