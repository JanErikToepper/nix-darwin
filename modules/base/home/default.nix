{ config, ... }: {
  imports = [
    ./aerospace
    ./fd
    ./firefox
    ./git
    ./kitty
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
