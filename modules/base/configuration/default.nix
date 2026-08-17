{ pkgs, ... }: {
  imports = [
    ./core
    ./homebrew
    ./system
    ./user
  ];

  environment.systemPackages = [ pkgs.aerospace ];
}
