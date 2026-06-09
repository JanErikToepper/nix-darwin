{ ... }: {
  home.file.".config/sketchybar/plugins/aerospace.sh" = {
    source = ./plugins/aerospace.sh; 
    executable = true;
  };

  home.file.".config/sketchybar/plugins/clock.sh" = {
    source = ./plugins/clock.sh; 
    executable = true;
  };

  programs.sketchybar = {
    enable = true; 
    service.enable = false;
    config = ''
      sketchybar --bar \
        y_offset=10 \
        color=0x00000000 \
        border_color=0x00000000 \
        height=40

      sketchybar --default \
        y_offset=2 \
        label.color=0xFFFFFFFF \
        label.align=center \
        label.padding_left=12 \
        label.padding_right=12 \
        background.drawing=on \
        background.color=0x00000000 \
        background.height=30 \
        background.corner_radius=5

      sketchybar --add event aerospace_workspace_change

      for sid in $(aerospace list-workspaces --all); do
        sketchybar --add item space.$sid left \
          --subscribe space.$sid aerospace_workspace_change \
          --set space.$sid \
            label="$sid" \
            background.color=0xFFFFFFFF \
            click_script="aerospace workspace $sid" \
            script="$CONFIG_DIR/plugins/aerospace.sh $sid"
      done
      
      sketchybar --add bracket spaces '/space\..*/'

      sketchybar --set spaces

      sketchybar --add item clock right \
           --set clock \
              script="$CONFIG_DIR/plugins/clock.sh" \
           --subscribe clock system_woke

      sketchybar --update
    '';
  };
}
