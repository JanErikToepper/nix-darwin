{ pkgs, config, ... }: let
  sketchybarPlugins = "${config.xdg.configHome}/sketchybar/plugins"; 
in {
  home.file = builtins.listToAttrs (map (plugin: {
    name = "${sketchybarPlugins}/${plugin}.sh"; 
    value = {
      source = ./plugins + "/${plugin}.sh"; 
      executable = true;
    };
  }) [ "colors" "aerospace" "update_aerospace_workspace" "audio" "battery" "clock" ]);

  programs.sketchybar = {
    enable = true; 
    config = ''
      source "${sketchybarPlugins}/colors.sh";

      function aerospace() {
        ${pkgs.aerospace}/bin/aerospace $@;
      }

      function sketchybar() {
        ${pkgs.sketchybar}/bin/sketchybar $@;
      }

      sketchybar --bar \
        color=0x00000000 \
        border_color=0x00000000 \
        height=30 \
        y_offset=5

      sketchybar --default \
        padding_left=5 \
        padding_right=5 \
        label.color=$DEFAULT_COLOR \
        label.align=center \
        label.padding_left=10 \
        label.padding_right=10 \
        background.drawing=on \
        background.color=$DEFAULT_BACKGROUND_COLOR \
        background.corner_radius=5 \
        background.border_color=$DEFAULT_BACKGROUND_BORDER_COLOR \
        background.border_width=1

      sketchybar --add event aerospace_workspace_change;

      for workspace in {0..9}; do
        sketchybar --add item space.$workspace left \
          --subscribe space.$workspace aerospace_workspace_change system_woke \
          --set space.$workspace \
            label="$workspace" \
            click_script="${sketchybarPlugins}/update_aerospace_workspace.sh" \
            script="${sketchybarPlugins}/aerospace.sh"
      done

      sketchybar --add item clock right \
        --subscribe clock system_woke \
        --set clock \
        update_freq=60 \
        script="${sketchybarPlugins}/clock.sh"

      sketchybar --default \
        icon.padding_left=10

      sketchybar --add item battery right \
        --subscribe battery system_woke \
        --set battery \
        update_freq=60 \
        script="${sketchybarPlugins}/battery.sh"

      sketchybar --add item audio right \
        --subscribe audio volume_change \
        --set audio \
        script="${sketchybarPlugins}/audio.sh"

      sketchybar --update
    '';
  };
}
