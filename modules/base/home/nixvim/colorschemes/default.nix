{ ... }: {
  programs.nixvim.colorschemes = {
    catppuccin = {
      enable = true;
      settings = {
        flavour = "mocha";
        integrations.notify = true;
      };
    };
  };
}
