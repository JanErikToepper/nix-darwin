{ pkgs, ... }: {
  home.file = builtins.listToAttrs (map (plugin: {
    name = ".config/sketchybar/plugins/${plugin}.sh"; 
    value = {
      source = ./plugins + "/${plugin}.sh"; 
      executable = true;
    };
  }) [ "aerospace" "audio" "battery" "clock" ]);

  programs.sketchybar = {
    enable = true; 
    service.errorLogFile = /Users/toepper/error.log;
    config = ''
      function aerospace() {
        /etc/profiles/per-user/toepper/bin/aerospace $@;
      }

      sketchybar --bar \
        color=0x00000000 \
        border_color=0x00000000 \
        height=30 \
        y_offset=5

      sketchybar --default \
        pading_left=10 \
        padding_right=10 \
        label.color=0xFFFFFFFF \
        label.align=center \
        label.padding_left=10 \
        label.padding_right=10 \
        background.drawing=on \
        background.color=0xFF222222 \
        background.corner_radius=5 \
        background.border_color=0xFF444444 \
        background.border_width=1

      sketchybar --add event aerospace_workspace_change

      for ((sid=1;sid<=9;sid++)); do
        sketchybar --add item space.$sid left \
          --subscribe space.$sid aerospace_workspace_change \
          --set space.$sid \
            label="$sid" \
            background.color=0xFFDDDDDD \
            background.border_color=0xFFFFFFFF \
            click_script="aerospace workspace $sid" \
            script="/Users/toepper/.config/sketchybar/plugins/aerospace.sh $sid"
      done

      sketchybar --add item clock right \
        --subscribe clock system_woke \
        --set clock \
        update_freq=60 \
        script="/Users/toepper/.config/sketchybar/plugins/clock.sh"

      sketchybar --default \
        icon.padding_left=10

      sketchybar --add item battery right \
        --subscribe battery system_woke \
        --set battery \
        update_freq=60 \
        script="/Users/toepper/.config/sketchybar/plugins/battery.sh"

      sketchybar --add item audio right \
        --subscribe audio volume_change \
        --set audio \
        icon.font="Hack Nerd Font:Regular:16.0" \
        script="/Users/toepper/.config/sketchybar/plugins/audio.sh"

      sketchybar --update
    '';
  };
}
