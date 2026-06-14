{ pkgs, ... }: {
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
      desktoppr
      nerd-fonts.hack
      tmuxifier
      prettierd
      hurl
    ];
  };
}
