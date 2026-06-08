{ pkgs, ... }: {
  imports = [
    ./aerospace
    ./fd
    ./firefox
    ./ripgrep
    ./sketchybar
    ./vim
    ./zsh
  ];  

  home = {
    username = "toepper";
    packages = with pkgs; [
      iterm2
      hurl
      nerd-fonts.hack 
    ];
  };
}
