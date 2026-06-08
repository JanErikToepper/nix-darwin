{ ... }: {
  home.file.".config/sketchybar/plugins/aerospace.sh" = {
    source = ./aerospace.sh; 
    executable = true;
  };
}
