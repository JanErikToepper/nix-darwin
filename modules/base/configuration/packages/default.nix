{ nixpkgs, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    nerd-fonts.hack 
  ];
}
