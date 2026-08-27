{ ... }: {
  programs.nixvim.plugins.notify = {
    enable = true;
    settings = {
      #level = "warn";
      max_width = 125;
      render = "compact";
      stages = "static";
    };
  };
}
