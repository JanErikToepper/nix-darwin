{ ... }: {
  programs.nixvim.colorschemes = {
    ayu.enable = false;
    bamboo.enable = true;
    catppuccin= {
      enable = false; 
      settings.flavour = "mocha";
    }; 
  };
}
