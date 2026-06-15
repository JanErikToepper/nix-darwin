{ config, ... }: {
  imports = [
    ./aerospace
    ./firefox
    ./git
    ./nixvim
  ];

  home = {
    username = config.user;

    stateVersion = "26.05";
  };
}
