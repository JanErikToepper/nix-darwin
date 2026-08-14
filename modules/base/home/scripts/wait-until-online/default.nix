{ pkgs, ... }: {
  config.customScripts.wait-until-online = pkgs.writeShellApplication {
    name = "wait-until-online";
    text = builtins.readFile ./wait-until-online.sh;
  };
}
