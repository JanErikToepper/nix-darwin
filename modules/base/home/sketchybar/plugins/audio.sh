#!/usr/bin/env bash

function main() {
  local VOLUME="$INFO"

  local IS_MUTED
  IS_MUTED="$(osascript -e "output muted of (get volume settings)")"

  local ICON
  local LABEL

  if $IS_MUTED; then
    ICON="󰝟"
    LABEL="-"
  else
    ICON="󰕾"
    LABEL="${VOLUME:-#}%"
  fi

  sketchybar --set audio \
    icon="$ICON" \
    label="$LABEL"
}

main
