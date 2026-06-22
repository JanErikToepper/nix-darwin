{ ... }: {
  homebrew = {
    enable = true; 
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };
    brews = [ "docker" ];
    casks = [
      "bitwarden"
      "datagrip"
      "docker-desktop"
      "figma"
    ];
  };
}
