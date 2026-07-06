{ ... }: {
  programs.nixvim.colorschemes = {
    ayu.enable = true;
    bamboo.enable = false;
    catppuccin= {
      enable = false; 
      settings.flavour = "mocha";
    }; 
    cyberdream.enable = false;
  };
}
