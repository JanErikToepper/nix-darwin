{ pkgs, ... }: {
  config.customScripts.watch-drs-watch = pkgs.writeShellApplication {
    name = "watch-drs-watch";
    text = builtins.readFile ./watch-drs-watch.sh;        
  };
}
