{ ... }: {
  homebrew = {
    enable = true; 
    brews = [ "docker" ];
    casks = [
      "bitwarden"
      "datagrip"
      "docker-desktop"
      "figma"
    ];
  };
}
