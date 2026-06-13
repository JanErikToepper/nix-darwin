{ config, pkgs, ... }: {
  imports = [
    ./aerospace
    ./fd
    ./firefox
    ./git
    ./kitty
    ./launchd
    ./nixvim
    ./ripgrep
    ./scripts
    ./sketchybar
    ./tmux
    ./vim
    ./zoxide
    ./zsh
  ];  

  home = {
    username = "toepper";
    packages = with pkgs; [
      nerd-fonts.hack
      tmuxifier
      prettierd
      hurl
    ];
  };
}
