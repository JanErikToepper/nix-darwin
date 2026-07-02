{ ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    shellAliases = {
      configure = "cd /etc/nix-darwin; nvim";
      ds = "devenv shell -q";
      drs = "stage-nix-darwin-configuration && sudo darwin-rebuild-switch";
      reboot = "sudo kill-all-aerospace-windows && sudo reboot";
      shutdown = "push-nix-darwin-configuration && sudo patched-shutdown";
      tx = "tmuxifier";
    };
    initContent = ''
      [[ -z "$TMUX" ]]  && { tmux attach || tmux }
    '';
  };
}
