{ ... }: {
  programs.alacritty = {
    enable = true;
    theme = "ayu_dark";
    settings.font.normal = {
      family = "Hack Nerd Font";
      style = "Regular";
    };
  };
}
