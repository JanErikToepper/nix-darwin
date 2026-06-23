{ config, pkgs, ... }: {
  config.customScripts.push-nix-darwin-configuration = pkgs.writeShellApplication {
    name = "push-nix-darwin-configuration";
    runtimeInputs = [ config.customScripts.stage-nix-darwin-configuration pkgs.git ];
    runtimeEnv = {
      MACHINE = config.machine;
    };
    text = builtins.readFile ./push-nix-darwin-configuration.sh;
  };
}
