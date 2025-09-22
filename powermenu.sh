#!/usr/bin/env bash

CHOICE=$(printf "1. Suspend\n2. Power Off\n3. Reboot\n4. Lockscreen\n5. Logout" \
         | rofi -dmenu -p "Power option:" | awk '{print $1}' | tr -d '.')

[ -z "$CHOICE" ] && exit 0  # user cancelled

case "$CHOICE" in
	1)
		systemctl suspend
		;;
	2)
		systemctl poweroff
		;;
	3)
		systemctl reboot
		;;
	4)
		light-locker-command -l
		;;
	5)
		i3-msg exit
		;;
	*)
		notify-send "Not a valid option!"
		;;
esac
