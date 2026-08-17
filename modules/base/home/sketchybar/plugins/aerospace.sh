#!/usr/bin/env bash

export PATH=/run/current-system/sw/bin/:$PATH

source "$CONFIG_DIR/plugins/colors.sh"

function main() {
  local current_workspace="$1"

  local active_workspaces
  active_workspaces="$(aerospace list-workspaces --all)"

  if [[ ! "$active_workspaces" =~ $current_workspace ]]; then
    sketchybar --set space."$current_workspace" \
      drawing=off

    return
  fi

  local focused_workspace="$FOCUSED_WORKSPACE"

  local visible_workspaces
  visible_workspaces="$(aerospace list-workspaces --monitor all --visible)"

  if [[ "$current_workspace" == "$focused_workspace" ]]; then
    sketchybar --set space."$current_workspace" \
      drawing=on \
      label.color="$FOCUSED_COLOR" \
      background.color="$FOCUSED_BACKGROUND_COLOR" \
      background.border_color="$FOCUSED_BACKGROUND_BORDER_COLOR"
  elif [[ ! "$visible_workspaces" =~ $current_workspace ]]; then
    sketchybar --set space."$current_workspace" \
      drawing=on \
      label.color="$INVISIBLE_COLOR" \
      background.color="$INVISIBLE_BACKGROUND_COLOR" \
      background.border_color="$INVISIBLE_BACKGROUND_BORDER_COLOR"
  else
    sketchybar --set space."$current_workspace" \
      drawing=on \
      label.color="$DEFAULT_COLOR" \
      background.color="$DEFAULT_BACKGROUND_COLOR" \
      background.border_color="$DEFAULT_BACKGROUND_BORDER_COLOR"
  fi
}

main "$(cut -d. -f2 <<<"$NAME")"
