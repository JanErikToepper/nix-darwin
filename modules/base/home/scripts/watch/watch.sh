DIRECTORY_ID="default";
QUERY="";

while getopts "i:q:" opt; do
  case ${opt} in
    i ) DIRECTORY_ID=$OPTARG;;
    q ) QUERY=$OPTARG;;
    * )
      echo "-i   Directory id to use to track changes in the .watch/ directory";
      echo "-q   Query to identify output to trigger change detection";
      exit 1;
    ;;
  esac
done

shift $((OPTIND -1))

FILES_TO_WATCH="$1";

shift;

if [[ -z "$FILES_TO_WATCH" ]]; then
  echo "Provide valid target files";
  exit 1;
fi


function emit_change_detection() {
  local watch_dir=".watch";

  mkdir -p "${watch_dir}/${DIRECTORY_ID}/";
  
  date +"%Y-%m-%d %H:%M:%S" > "${watch_dir}/${DIRECTORY_ID}/change_detected_timestamp";
}

function handle_changes() {
  if [[ -z "$QUERY" ]]; then
    "$@";

    emit_change_detection;
  else
    "$@" | while read -r line; do
      echo "$line";

      if [[ "$line" == *"$QUERY"* ]]; then
        emit_change_detection;
      fi
    done
  fi
}

export -f handle_changes;
export -f track_changes;
export DIRECTORY_ID;
export QUERY;

fd . "$FILES_TO_WATCH" | entr -c -r bash -c 'handle_changes "$@"' _ "$@";
