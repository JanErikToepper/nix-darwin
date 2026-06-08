#!/usr/bin/env bash

function main() {
  if [[ "$1" = "$FOCUSED_WORKSPACE" ]]; then
    sketchybar --set space.$1 background.drawing=on
  else
    sketchybar --set space.$1 background.drawing=off
  fi
}

main "$1";
