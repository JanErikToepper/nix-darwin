{ ... }: {
  programs.git = {
    hooks = {
      prepare-commit-msg = ./hooks/prepare-commit-msg;
    };
    settings.user.email = "jan.toepper@hornetsecurity.com";
  };
}

