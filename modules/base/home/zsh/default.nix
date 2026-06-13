{ ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    shellAliases = {
      configure = "vim /etc/nix-darwin/modules";
      drs = "sudo darwin-rebuild-switch";
      reboot = "sudo kill-all-aerospace-windows && reboot";
      shutdown = "sudo push-nix-darwin-configuration-and-shutdown";
      tx = "tmuxifier";
    };
    initContent = ''
      [[ -z "$TMUX" ]]  && { tmux attach || tmux }
    '';
  };
}
