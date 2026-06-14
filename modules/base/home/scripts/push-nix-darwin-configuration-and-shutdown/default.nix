{ config, pkgs, ... }: {
  config.customScripts.push-nix-darwin-configuration-and-shutdown = pkgs.writeShellApplication {
    name = "push-nix-darwin-configuration-and-shutdown";
    runtimeInputs = with config.customScripts; [ kill-all-aerospace-windows  ];
    runtimeEnv = {
      MACHINE = config.machine;
    };
    text = builtins.readFile ./push-nix-darwin-configuration-and-shutdown.sh;
  };
}
