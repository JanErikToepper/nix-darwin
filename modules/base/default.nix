{ ... }: {
  imports = [ ./configuration ];

  config.home-manager.users.toepper = {
    imports = [ ./home ];
  };
}
