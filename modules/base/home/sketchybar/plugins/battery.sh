#!/usr/bin/env bash

main() {
  local PERCENTAGE
  PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"

  local ICON

  if [[ "$PERCENTAGE" == 100 ]]; then
    ICON="󰁹"
  elif [[ "$PERCENTAGE" -ge 90 ]]; then
    ICON="󰂂"
  elif [[ "$PERCENTAGE" -ge 80 ]]; then
    ICON="󰂁"
  elif [[ "$PERCENTAGE" -ge 70 ]]; then
    ICON="󰂀"
  elif [[ "$PERCENTAGE" -ge 60 ]]; then
    ICON="󰁿"
  elif [[ "$PERCENTAGE" -ge 50 ]]; then
    ICON="󰁾"
  elif [[ "$PERCENTAGE" -ge 40 ]]; then
    ICON="󰁽"
  elif [[ "$PERCENTAGE" -ge 30 ]]; then
    ICON="󰁼"
  elif [[ "$PERCENTAGE" -ge 20 ]]; then
    ICON="󰁻"
  elif [[ "$PERCENTAGE" -ge 10 ]]; then
    ICON="󰁺"
  else
    ICON="󰂎"
  fi

  sketchybar --set battery \
    icon="$ICON" \
    label="${PERCENTAGE}%"
}

main
