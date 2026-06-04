{ self, nixpkgs, ... } @ args: {
  nix.settings.experimental-features = "nix-command flakes";

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.stateVersion = 6;
}
