{ pkgs, ... }: {
  imports = [
    ./aerospace
    ./fd
    ./firefox
    ./git
    ./kitty
    ./ripgrep
    ./sketchybar
    ./tmux
    ./vim
    ./zoxide
    ./zsh
  ];  

  home = {
    username = "toepper";
    packages = with pkgs; [
      hurl
      nerd-fonts.hack
      tmuxifier
    ];
  };
}
