{ ... }: {
  programs.zsh.shellAliases = {
    drs = ''
      cd /etc/nix-darwin;
      git add --all .;
      sudo darwin-rebuild switch --flake .#private;
      cd -;
    '';
    config = "vim /etc/nix-darwin/modules";
  };
}
