{ config, ... }: {
  imports = [ ./firefox ];

  home = {
    username = config.user;

    stateVersion = "25.11";
  };
}
