{ config, ... }: {
  imports = [
    ./aerospace
    ./firefox
  ];

  home = {
    username = config.user;

    stateVersion = "25.11";
  };
}
