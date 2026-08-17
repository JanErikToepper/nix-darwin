{ ... }: {
  programs.git = {
    enable = true;
    ignores = [
      ".devenv*"
      "devenv*"
      ".env"
      ".hurl/"
      ".watch/"
    ];
    settings = {
      adivce.detachedHead = false;
      branch.sort = "~committerdate";
      diff.algorithm = "histogram";
      fetch.prune = true;
      init.defaultBranch = "main";
      pull.rebase = true;
      push.autoSetupRemote = true;
      rebase.updateRefs = true;
      user.name = "Jan Erik Töpper";
    };
  };
}
