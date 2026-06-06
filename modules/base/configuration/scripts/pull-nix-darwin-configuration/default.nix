{ pkgs, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      pull-nix-darwin-configuration = final.writeShellApplication {
        name = "pull-nix-darwin-configuration";
        text = builtins.readFile ./pull-nix-darwin-configuration.sh;
      };
    })
  ];
}
