{ pkgs, ... }: {
  imports = [
    ./aerospace
    ./fd
    ./firefox
    ./ripgrep
    ./sketchybar
    ./vim
    ./zoxide
    ./zsh
  ];  

  home = {
    username = "toepper";
    packages = with pkgs; [
      iterm2
      hurl
    ];
  };
}
