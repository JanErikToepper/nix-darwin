{ config, ... }: {
  launchd.daemons = {
    sync = {
      command = "${config.customScripts.watch-drs-watch}/bin/watch-drs-watch && ${config.customScripts.darwin-rebuild-switch}/bin/darwin-rebuild-switch";
      serviceConfig = {
        RunAtLoad = true;
        WatchPaths = [ "/etc/nix-darwin/.watch/" ];
      };
    };
  };
}
