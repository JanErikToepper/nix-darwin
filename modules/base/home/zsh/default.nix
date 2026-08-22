{ ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    shellAliases = {
      configure = "cd /etc/nix-darwin; nvim";
      ds = "devenv shell -q";
      drs = "stage-nix-darwin-configuration && sudo darwin-rebuild-switch";
      shutdown = "push-nix-darwin-configuration && sudo shutdown -h now";
      tx = "tmuxifier";
      mentor = "ollama run --hidethinking java-mentor";
    };
    initContent = ''
      [[ -z "$TMUX" ]]  && { tmux attach || tmux }
    '';
  };
}
