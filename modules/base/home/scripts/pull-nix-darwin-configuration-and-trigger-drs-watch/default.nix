{ config, pkgs, ... }: {
  config.customScripts.pull-nix-darwin-configuration-and-trigger-drs-watch = pkgs.writeShellApplication {
    name = "pull-nix-darwin-configuration-and-trigger-drs-watch";
    text = "${config.customScripts.pull-nix-darwin-configuration}/bin/pull-nix-darwin-configuration && ${config.customScripts.trigger-drs-watch}/bin/trigger-drs-watch";
  };
}
