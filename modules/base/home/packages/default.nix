{ pkgs, ... }: {
  home.packages = with pkgs; [
    desktoppr
    nerd-fonts.hack
    tmuxifier
    devenv
    prettierd
    entr
    hurl
  ];
}
