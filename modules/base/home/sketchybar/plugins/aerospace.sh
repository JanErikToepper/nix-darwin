#!/usr/bin/env bash

source "$CONFIG_DIR/plugins/colors.sh";

export PATH=/run/current-system/sw/bin:$PATH;

function main() {
  local current_workspace="$1";

  local active_workspaces;
  active_workspaces="$(aerospace list-workspaces --all)";

  if [[ ! "$active_workspaces" =~ "$current_workspace" ]]; then
    sketchybar --set space.$current_workspace \
      drawing=off

    return;
  fi

  local focused_workspace="$FOCUSED_WORKSPACE";

  if [[ "$current_workspace" == "$focused_workspace" ]]; then
    sketchybar --set space.$current_workspace \
      drawing=on \
      label.color=$FOCUSED_COLOR \
      background.color=$FOCUSED_BACKGROUND_COLOR \
      background.border_color=$FOCUSED_BACKGROUND_BORDER_COLOR
  else
    sketchybar --set space.$current_workspace \
      drawing=on \
      label.color=$DEFAULT_COLOR \
      background.color=$DEFAULT_BACKGROUND_COLOR \
      background.border_color=$DEFAULT_BACKGROUND_BORDER_COLOR
  fi
}

main "$(cut -d. -f2 <<< "$NAME")";
