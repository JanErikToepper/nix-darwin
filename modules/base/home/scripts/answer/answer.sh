JAVA_MENTOR_DIR="$TMPDIR/java-mentor"
CHAT_DIR="$JAVA_MENTOR_DIR/chat"
IS_ASKING_FILEPATH="$JAVA_MENTOR_DIR/is_asking"
ANSWERS_FILEPATH="$JAVA_MENTOR_DIR/answers.md"

function get_is_asking() {
  if [[ ! -f "$IS_ASKING_FILEPATH" ]]; then
    echo "false"
  fi

  local IS_ASKING
  IS_ASKING="$(cat "$IS_ASKING_FILEPATH")"

  echo "$IS_ASKING"
}

function setup() {
  local IS_ASKING
  IS_ASKING="$(get_is_asking)"

  while [[ "$IS_ASKING" == "true" ]]; do
    echo -ne "Wait until mentor answered the current question...\r"

    IS_ASKING="$(get_is_asking)"

    sleep 1
  done

  rm -rf "$CHAT_DIR"

  mkdir -p "$JAVA_MENTOR_DIR"

  echo "# New chat session" >"$ANSWERS_FILEPATH"
}

function main() {
  setup

  echo "$ANSWERS_FILEPATH" | entr -c mdt "$ANSWERS_FILEPATH"
}

main
