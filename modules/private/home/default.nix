{ config, ... }: {
  imports = [ ./aerospace ];

  home = {
    username = config.user;

    stateVersion = "25.11";
  };
}
