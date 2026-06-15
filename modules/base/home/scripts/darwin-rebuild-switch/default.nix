{ config, pkgs, ... }: {
  config.customScripts.darwin-rebuild-switch = pkgs.writeShellApplication {
    name = "darwin-rebuild-switch";
    runtimeInputs = with pkgs; [ git ];
    runtimeEnv = {
      MACHINE = config.machine;
    };
    text = builtins.readFile ./darwin-rebuild-switch.sh;        
  };
}
