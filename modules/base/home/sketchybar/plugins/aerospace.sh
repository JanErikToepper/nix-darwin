#!/usr/bin/env bash

function main() {
  if [[ "$1" = "$FOCUSED_WORKSPACE" ]]; then
    sketchybar --set space.$1 \
      background.drawing=on \
      label.color=0xFF000000
  else
    sketchybar --set space.$1 \
      background.drawing=off \
      label.color=0xFFFFFFFF
  fi
}

main "$1";
