{ ... }: {
  imports = [ ./plugins ];

  programs.sketchybar = {
    enable = true; 
    service.enable = true;
    config = ''
      sketchybar --bar \
        color=0x00000000 \
        border_color=0x00000000 \
        height=40 \

      sketchybar --default \
        padding_left=10 \
        padding_right=10 \
        label.color=0xFF000000 \
        background.drawing=on \
        background.color=0xFFFFFFFF \
        background.height=25 \
        background.corner_radius=2 \
        background.padding_left=10 \
        background.padding_right=10 \

      sketchybar --add event aerospace_workspace_change

      for sid in $(aerospace list-workspaces --all); do
        sketchybar --add item space.$sid left \
          --subscribe space.$sid aerospace_workspace_change \
          --set space.$sid \
          background.drawing=off \
          label="$sid" \
          click_script="aerospace workspace $sid" \
          script="$CONFIG_DIR/plugins/aerospace.sh $sid"
      done
      
      sketchybar --add bracket spaces '/space\..*/'

      sketchybar --set spaces \
        background.color=0xAAFFFFFF \
        background.corner_radius=2 \
        background.height=25

      sketchybar --update
    '';
  };
}
