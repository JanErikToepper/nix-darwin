{ pkgs, ... }: {
  config.customScripts.watch = pkgs.writeShellApplication {
    name = "watch";
    runtimeInputs = with pkgs; [ getopt fd entr ];
    text = builtins.readFile ./watch.sh;
  };
}
