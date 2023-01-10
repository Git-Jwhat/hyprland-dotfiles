#!/bin/sh
set -eu
# You can call the script like this:
# $./micstatus.sh status

get_status () {
	g=$(pactl get-source-mute @DEFAULT_SOURCE@ | grep -o ":.*" | cut -d ":" -f 2)
}

status_check () {
	get_status
	if [ "$g" = " no" ]; then
	 dunstify -u normal " Microphone unmuted"
	elif [ "$g" = " yes" ]; then
	 dunstify -u normal " Microphone muted"
	 fi
}
case $1 in
status)
      pactl set-source-mute @DEFAULT_SOURCE@ toggle
      status_check
      ;;
esac
