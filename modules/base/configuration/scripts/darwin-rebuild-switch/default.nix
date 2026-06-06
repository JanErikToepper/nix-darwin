{ config, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      darwin-rebuild-switch = final.writeShellApplication {
        name = "darwin-rebuild-switch";
        runtimeEnv = {
          MACHINE = config.machine;
        };
        text = builtins.readFile ./darwin-rebuild-switch.sh;        
      };
    })
  ]; 
}
