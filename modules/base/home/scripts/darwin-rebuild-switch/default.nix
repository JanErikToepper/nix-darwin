{ config, pkgs, ... }: {
  config.customScripts.darwin-rebuild-switch = pkgs.writeShellApplication {
    name = "darwin-rebuild-switch";
    runtimeEnv = {
      MACHINE = config.machine;
    };
    text = builtins.readFile ./darwin-rebuild-switch.sh;
  };
}
