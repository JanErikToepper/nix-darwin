{ ... }: {
  imports = [ ./configuration ];

  config = {
    machine = "private";

    home-manager.users.toepper = {
      imports = [ ./home ];
    };
  };
}
