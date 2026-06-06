{ pkgs, ... }: {
  users.users.toepper.home = /Users/toepper;

  security.sudo.extraConfig = ''
    toepper ALL=(ALL) NOPASSWD: ${pkgs.push-nix-darwin-configuration-and-shutdown}
  '';
}
