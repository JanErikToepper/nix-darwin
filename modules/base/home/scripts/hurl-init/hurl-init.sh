function main() {
  mkdir -p ./.hurl/

  cat >./.hurl/_watch.sh <<"EOF"
#!/usr/bin/env bash

hurl ./.hurl/default.hurl;
EOF

  chmod +x ./.hurl/_watch.sh

  touch ./.hurl/default.hurl
}

main
