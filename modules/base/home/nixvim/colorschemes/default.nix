{ ... }: {
  programs.nixvim.colorschemes = {
    ayu.enable = true;
    catppuccin= {
      enable = false; 
      settings.flavour = "mocha";
    }; 
  };
}
