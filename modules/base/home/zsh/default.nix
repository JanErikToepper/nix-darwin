{ ... }: {
  programs.zsh = {
    enable = true;
    autocd = true;
    shellAliases = {
      configure = "vim /etc/nix-darwin/modules";
      drs = "sudo darwin-rebuild-switch";
      shutdown = "sudo push-nix-darwin-configuration-and-shutdown";
    };
  };
}
