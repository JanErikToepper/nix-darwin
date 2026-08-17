{ pkgs, ... }: {
  home.packages = with pkgs; [
    nerd-fonts.hack
    tmuxifier
    devenv
    hurl
    spring-boot-cli
  ];
}
