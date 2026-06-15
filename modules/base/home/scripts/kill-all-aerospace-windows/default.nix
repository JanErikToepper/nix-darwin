{ config, pkgs, ... }: {
  config.customScripts.kill-all-aerospace-windows = pkgs.writeShellApplication {
    name = "kill-all-aerospace-windows";  
    runtimeInputs = [ pkgs.aerospace ];
    runtimeEnv = {
      USER = config.user; 
    };
    text = builtins.readFile ./kill-all-aerospace-windows.sh;
  };
}
