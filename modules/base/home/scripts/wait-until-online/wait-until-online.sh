function main() {
  while ! nc -z -w 1 google.com 443 &>/dev/null; do
    sleep 1
  done
}

main
