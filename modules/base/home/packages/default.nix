{ pkgs, ... }: {
  home.packages = with pkgs; [
    desktoppr
    nerd-fonts.hack
    defaultbrowser
    tmuxifier
    devenv
    prettierd
    entr
    hurl
  ];
}
