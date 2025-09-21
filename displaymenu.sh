#!/usr/bin/env bash

CHOICE=$(printf "1. Laptop only\n2. Mirror\n3. Extend Left+Right\n4. Extend Bottom+Top" \
         | rofi -dmenu -p "Display Mode:" | awk '{print $1}' | tr -d '.')

[ -z "$CHOICE" ] && exit 0  # user cancelled
notify-send "Mode $CHOICE Selected."
DIR="$(dirname "$(readlink -f "$0")")"
"$DIR/displaymode.sh" "$CHOICE"
# ./displaymode.sh "$CHOICE"
