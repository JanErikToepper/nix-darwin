{ pkgs, ... }: {
  config.customScripts.pull-nix-darwin-configuration = pkgs.writeShellApplication {
    name = "pull-nix-darwin-configuration";
    runtimeInputs = [ pkgs.git ];
    text = builtins.readFile ./pull-nix-darwin-configuration.sh;
  };
}
