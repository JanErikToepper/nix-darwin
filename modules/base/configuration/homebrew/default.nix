{ ... }: {
  homebrew = {
    enable = true; 
    onActivation.cleanup = "uninstall";
    brews = [ "docker" ];
    casks = [
      "bitwarden"
      "datagrip"
      "docker-desktop"
      "figma"
    ];
  };
}
