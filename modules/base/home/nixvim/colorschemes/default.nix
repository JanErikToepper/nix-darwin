{ ... }: {
  programs.nixvim.colorschemes = {
    ayu.enable = false;
    bamboo.enable = false;
    catppuccin= {
      enable = true; 
      settings.flavour = "mocha";
    }; 
    cyberdream.enable = false;
  };
}
