{ config, ... }: {
  imports = [
    ./activation
    ./aerospace
    ./alacritty
    ./fd
    ./firefox
    ./git
    ./launchd
    ./nixvim
    ./packages
    ./ripgrep
    ./scripts
    ./sketchybar
    ./system
    ./tmux
    ./vim
    ./zoxide
    ./zsh
  ];

  home.username = config.user;
}
