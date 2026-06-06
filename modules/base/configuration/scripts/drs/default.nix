{ ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      drs = final.writeShellApplication {
        name = "drs";
        text = builtins.readFile ./drs.sh;        
      };
    })
  ]; 
}
