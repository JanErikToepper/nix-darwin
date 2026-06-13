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
      (pkgs.writeShellApplication {
        name = "test-kill-all-aerospace-windows";
        runtimeInputs = with pkgs; [ aerospace ];
        text = builtins.readFile ../configuration/scripts/kill-all-aerospace-windows/kill-all-aerospace-windows.sh;
      })
      hurl
      nerd-fonts.hack
      tmuxifier
    ];
  };
}
