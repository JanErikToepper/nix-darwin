{ config, pkgs, ... }: {
  config.customScripts.kill-all-aerospace-windows = pkgs.writeShellApplication {
    name = "kill-all-aerospace-windows";  
    runtimeInputs = [ pkgs.aerospace ];
    runtimeEnv = {
      USER = config.home.username; 
    };
    text = builtins.readFile ./kill-all-aerospace-windows.sh;
  };
}
