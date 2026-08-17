{ ... }: {
  programs.git.settings = {
    core.hooksPath = "~/.config/git/hooks/";
    user.email = "jan.toepper@hornetsecurity.com";
  };

  home.file.".config/git/hooks/prepare-commit-msg" = {
    text = builtins.readFile ./hooks/prepare-commit-msg;
    executable = true;
  };
}
