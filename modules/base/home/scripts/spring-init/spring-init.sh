function main() {
  PACKAGE_IDENTIFIER="$1"

  if [[ -z "$PACKAGE_IDENTIFIER" ]]; then
    echo "Provide a valid package identifier"
    exit 1
  fi

  [[ "$PACKAGE_IDENTIFIER" =~ (.+)\.(.+)$ ]]

  GROUP_ID="${BASH_REMATCH[1]}"
  ARTIFACT_ID="${BASH_REMATCH[2]}"

  if [[ -z "$ARTIFACT_ID" ]]; then
    echo "Couldn't extract artifact id'"
    exit 1
  fi

  spring init --artifact-id "$ARTIFACT_ID" --build "maven" --dependencies web --group-id "$GROUP_ID" "$ARTIFACT_ID"
}

main "$@"
