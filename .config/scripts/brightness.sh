#!/bin/sh
set -eu
# You can call this script like this:
# $./brightness.sh up
# $./brightness.sh down

get_brightness () {
    b=$(brightnessctl | grep -o "(.*)" | cut -d "%" -f 1 | cut -d "(" -f 2)
}

send_notification () {
	# Send the notification
    dunstify -t 1600 -h string:x-dunst-stack-tag:brightness -u normal "Brightness" -h int:value:"$b"
}
brightness_check () {
    get_brightness
    if [ "$b" -ge 70 ]; then
        changevalue="10%"
    elif [ "$b" -ge 50 ]; then
    	changevalue="10%"
    elif [ "$b" -ge 10 ]; then
    	changevalue="5%"
    elif [ "$b" -ge 5 ]; then
        changevalue="2%"
    else
    	changevalue="1%"
    fi
}
case $1 in
    up)
	brightness_check
        brightnessctl s +$changevalue > /dev/null
        send_notification
        ;;
    down)
	brightness_check
        brightnessctl s $changevalue- > /dev/null
        send_notification
        ;;
esac
