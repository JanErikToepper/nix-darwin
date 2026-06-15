{ config, pkgs, ... }: {
  config.customScripts.pull-nix-darwin-configuration = pkgs.writeShellApplication {
    name = "pull-nix-darwin-configuration";
    runtimeInputs = with config.customScripts; [ darwin-rebuild-switch ];
    text = builtins.readFile ./pull-nix-darwin-configuration.sh;
  };
}
