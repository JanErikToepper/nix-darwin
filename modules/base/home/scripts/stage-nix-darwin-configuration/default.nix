{ pkgs, ... }: {
  config.customScripts.stage-nix-darwin-configuration = pkgs.writeShellApplication {
    name = "stage-nix-darwin-configuration";
    runtimeInputs = with pkgs; [ git ];
    text = builtins.readFile ./stage-nix-darwin-configuration.sh;
  };
}
