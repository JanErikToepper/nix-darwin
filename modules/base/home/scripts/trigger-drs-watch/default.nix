{ pkgs, ... }: {
  config.customScripts.trigger-drs-watch = pkgs.writeShellApplication {
    name = "trigger-drs-watch";
    text = builtins.readFile ./trigger-drs-watch.sh;
  };
}
