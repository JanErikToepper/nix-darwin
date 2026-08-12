{ ... }: {
  programs.alacritty = {
    enable = true;
    theme = "catppuccin_mocha";
    settings.font.normal = {
      family = "Hack Nerd Font";
      style = "Regular";
    };
  };
}
