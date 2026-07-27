{ pkgs, ... }: {
  config.customScripts.hurl-init = pkgs.writeShellApplication {
    name = "hurl-init";
    runtimeInputs = [ pkgs.hurl ];
    text = builtins.readFile ./hurl-init.sh;
  };
}
