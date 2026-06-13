{ nixpkgs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    aerospace
    nerd-fonts.hack 
  ];
}
