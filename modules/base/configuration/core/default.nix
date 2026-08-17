{ ... }: {
  nix = {
    gc = {
      interval.Weekday = 1;
      automatic = true;
    };
    settings.experimental-features = "nix-command flakes";
  };

  nixpkgs = {
    config.allowUnfree = true;

    hostPlatform = "aarch64-darwin";
  };
}
