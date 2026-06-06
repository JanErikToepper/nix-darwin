{ pkgs, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      pull-nix-darwin-configuration = final.writeShellApplication {
        name = "pull-nix-darwin-configuration";
        runtimeInputs = with pkgs; [ darwin-rebuild-switch ];
        text = builtins.readFile ./pull-nix-darwin-configuration.sh;
      };
    })
  ];
}
