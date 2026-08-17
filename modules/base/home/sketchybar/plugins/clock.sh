#!/usr/bin/env bash

function main() {
  sketchybar --set clock label="$(date '+%a %d %b %I:%M %p')"
}

main
