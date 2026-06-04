{ ... }: {
  programs.zsh.shellAliases = {
    drs = "sudo darwin-rebuild switch --flake /etc/nix-darwin#private";
  };
}
