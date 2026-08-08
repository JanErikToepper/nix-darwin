{ pkgs, ... }: {
  home.packages = with pkgs; [
    desktoppr
    nerd-fonts.hack
    defaultbrowser
    tmuxifier
    devenv
    entr
    hurl
    spring-boot-cli
  ];
}
