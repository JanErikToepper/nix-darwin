{ ... }: {
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };
    greedyCasks = true;
    brews = [ "docker" ];
    casks = [
      "bitwarden"
      "datagrip"
      "docker-desktop"
      "figma"
    ];
  };
}
