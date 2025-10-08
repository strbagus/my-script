#!/usr/bin/env bash

CHOICE=$(printf "1. Logout\n2. Suspend\n3. Power Off\n4. Reboot\n5. Lockscreen" \
         | rofi -dmenu -p "Power option:" | awk '{print $1}' | tr -d '.')

[ -z "$CHOICE" ] && exit 0  # user cancelled

case "$CHOICE" in
	1)
		i3-msg exit
		;;
	2)
		systemctl suspend
		;;
	3)
		systemctl poweroff
		;;
	4)
		systemctl reboot
		;;
	5)
		light-locker-command -l
		;;
	*)
		notify-send "Not a valid option!"
		;;
esac
