{ pkgs, ... }: {
  config.customScripts.spring-init = pkgs.writeShellApplication {
    name = "spring-init";
    runtimeInputs = with pkgs; [ spring-boot-cli ];
    text = builtins.readFile ./spring-init.sh;
  };
}
