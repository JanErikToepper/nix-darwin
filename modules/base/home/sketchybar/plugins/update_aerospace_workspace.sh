#!/usr/bin/env bash

export PATH=/run/current-system/sw/bin:$PATH;

function main() {
  local current_workspace="$1";

  aerospace workspace "$current_workspace";
}

main "$(cut -d. -f2 <<< "$NAME")";
