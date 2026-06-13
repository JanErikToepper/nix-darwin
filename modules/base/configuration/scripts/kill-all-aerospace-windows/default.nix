{ pkgs, config, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      kill-all-aerospace-windows = final.writeShellApplication {
        name = "kill-all-aerospace-windows"; 
        runtimeInputs = [ pkgs.aerospace config.services.aerospace.package ];
        text = builtins.readFile ./kill-all-aerospace-windows.sh;
      };
    })
  ];
}
