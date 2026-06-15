{ config, pkgs, ... }: {
  config.customScripts.patched-shutdown = pkgs.writeShellApplication {
    name = "patched-shutdown";
    runtimeInputs = with config.customScripts; [ kill-all-aerospace-windows  ];
    text = builtins.readFile ./patched-shutdown.sh;
  };
}
