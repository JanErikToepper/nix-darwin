{ config, ... }: {
  imports = [
    ./aerospace
    ./alacritty
    ./fd
    ./firefox
    ./git
    ./launchd
    ./nixvim
    ./ollama
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
