{ ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    shellAliases = {
      configure = "cd /etc/nix-darwin/modules; nvim .";
      drs = "sudo darwin-rebuild-switch";
      reboot = "sudo kill-all-aerospace-windows && sudo reboot";
      shutdown = "push-nix-darwin-configuration && sudo patched-shutdown";
      tx = "tmuxifier";
    };
    initContent = ''
      [[ -z "$TMUX" ]]  && { tmux attach || tmux }

      eval "$(devenv hook zsh)";
    '';
  };
}
