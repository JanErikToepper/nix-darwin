{ pkgs, config, ... }: {
  nixpkgs.overlays = [
    (final: prev: {
      push-nix-darwin-configuration-and-shutdown = final.writeShellApplication {
        name = "push-nix-darwin-configuration-and-shutdown";
        runtimeEnv = {
          MACHINE = config.machine;
        };
        text = builtins.readFile ./push-nix-darwin-configuration-and-shutdown.sh;
      };
    })
  ];
}
