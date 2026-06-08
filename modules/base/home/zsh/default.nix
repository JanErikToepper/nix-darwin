{ ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    prezto.tmux = {
      autoStartLocal = true; 
      itermIntegration = true;
    };
    shellAliases = {
      configure = "vim /etc/nix-darwin/modules";
      drs = "sudo darwin-rebuild-switch";
      shutdown = "sudo push-nix-darwin-configuration-and-shutdown";
    };
  };
}
