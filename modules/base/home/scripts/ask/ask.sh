JAVA_MENTOR_DIR="$TMPDIR/java-mentor"
CHAT_DIR="$JAVA_MENTOR_DIR/chat"
EXCHANGE_FILEPATH="$CHAT_DIR/.exchange_id"
IS_ASKING_FILEPATH="$JAVA_MENTOR_DIR/is_asking"
ANSWERS_FILEPATH="$JAVA_MENTOR_DIR/answers.md"
QUESTION_FILENAME="question"
ANSWER_FILENAME="answer"

function reset() {
  set_is_asking "false"

  exit 1
}

function setup() {
  mkdir -p "$CHAT_DIR"
  touch "$EXCHANGE_FILEPATH"

  trap reset SIGINT
}

function set_is_asking() {
  local IS_ASKING="$1"

  echo "$IS_ASKING" >"$IS_ASKING_FILEPATH"
}

function get_next_exchange_id() {
  local EXCHANGE_ID
  EXCHANGE_ID="$(cat "$EXCHANGE_FILEPATH")"
  EXCHANGE_ID="${EXCHANGE_ID:-0}"
  ((EXCHANGE_ID++))

  echo "$EXCHANGE_ID"
}

function set_exchange_id() {
  local EXCHANGE_ID="$1"

  echo "$EXCHANGE_ID" >"$EXCHANGE_FILEPATH"
}

function get_question_filepath() {
  local EXCHANGE_ID="$1"

  echo "$CHAT_DIR/$QUESTION_FILENAME-$EXCHANGE_ID.md"
}

function get_answer_filepath() {
  local EXCHANGE_ID="$1"

  echo "$CHAT_DIR/$ANSWER_FILENAME-$EXCHANGE_ID.md"
}

function set_question_file() {
  local EXCHANGE_ID="$1"
  local QUESTION="$2"

  local QUESTION_FILEPATH
  QUESTION_FILEPATH="$(get_question_filepath "$EXCHANGE_ID")"

  echo "$QUESTION" >"$QUESTION_FILEPATH"
}

function set_answer_file() {
  local EXCHANGE_ID="$1"
  local ANSWER="$2"

  local ANSWER_FILEPATH
  ANSWER_FILEPATH="$(get_answer_filepath "$EXCHANGE_ID")"

  echo "$ANSWER" >"$ANSWER_FILEPATH"
}

function append_answers_file() {
  local ANSWER="$1"

  # shellcheck disable=2028
  echo "----- $ANSWER" >>"$ANSWERS_FILEPATH"
}

function convert_message_object() {
  local ROLE="$1"
  local CONTENT="$2"

  local MESSAGE_OBJECT
  MESSAGE_OBJECT="$(jq -n --arg role "$ROLE" --arg content "$CONTENT" '{ "role": $role, "content": $content }')"

  echo "$MESSAGE_OBJECT"
}

function get_messages() {
  local EXCHANGE_ID="$1"

  local MESSAGES=()

  for CURRENT_EXCHANGE_ID in $(seq 1 "$EXCHANGE_ID"); do
    local QUESTION_FILEPATH
    QUESTION_FILEPATH="$(get_question_filepath "$CURRENT_EXCHANGE_ID")"

    local ANSWER_FILEPATH
    ANSWER_FILEPATH="$(get_answer_filepath "$CURRENT_EXCHANGE_ID")"

    if [[ -f "$QUESTION_FILEPATH" ]]; then
      local ANSWER_CONTENT
      ANSWER_CONTENT="$(cat "$QUESTION_FILEPATH")"

      local ANSWER_MESSAGE_OBJECT
      ANSWER_MESSAGE_OBJECT="$(convert_message_object "user" "$ANSWER_CONTENT")"

      MESSAGES+=("$ANSWER_MESSAGE_OBJECT")
    fi

    if [[ -f "$ANSWER_FILEPATH" ]]; then
      local ANSWER_CONTENT
      ANSWER_CONTENT="$(cat "$ANSWER_FILEPATH")"

      local ANSWER_MESSAGE_OBJECT
      ANSWER_MESSAGE_OBJECT="$(convert_message_object "assistant" "$ANSWER_CONTENT")"

      MESSAGES+=("$ANSWER_MESSAGE_OBJECT")
    fi
  done

  IFS=", "

  echo "${MESSAGES[*]}"
}

function ask_llm() {
  # shellcheck disable=SC2178
  local MESSAGES="$1"

  # shellcheck disable=SC2128
  local PAYLOAD="{ \"model\": \"java-mentor\", \"messages\": [$MESSAGES], \"stream\": false, \"think\": false }"

  local RESPONSE
  RESPONSE="$(curl -s -X POST http://localhost:11434/api/chat -d "$PAYLOAD")"

  echo "$RESPONSE" | jq -r ".message.content"
}

function main() {
  setup

  while true; do
    read -r -p "> " QUESTION

    set_is_asking "true"

    local EXCHANGE_ID
    EXCHANGE_ID="$(get_next_exchange_id)"

    set_exchange_id "$EXCHANGE_ID"

    set_question_file "$EXCHANGE_ID" "$QUESTION"

    local MESSAGES
    MESSAGES="$(get_messages "$EXCHANGE_ID")"

    local ANSWER_CONTENT
    ANSWER_CONTENT="$(ask_llm "$MESSAGES")"

    set_answer_file "$EXCHANGE_ID" "$ANSWER_CONTENT"

    append_answers_file "$ANSWER_CONTENT"

    set_is_asking "false"
  done
}

main
