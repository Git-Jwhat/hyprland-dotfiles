#!/bin/sh
set -eu
# You can call this script like this:
# $./keybrightness.sh up
# $./keybrightness.sh down

get_brightness () {
    b=$(brightnessctl -d asus::kbd_backlight | grep -o "(.*)" | cut -d "%" -f 1 | cut -d "(" -f 2)
}

send_notification () {
	# Send the notification
    dunstify -t 1600 -h string:x-dunst-stack-tag:brightness -u normal "Keyboard Brightness" -h int:value:"$b"
}
brightness_check () {
    get_brightness
    if [ "$b" -ge 3 ]; then
        changevalue="100%"
    elif [ "$b" -ge 2 ]; then
    	changevalue="50%"
    elif [ "$b" -ge 1 ]; then
    	changevalue="5%"
    elif [ "$b" -ge 0 ]; then
        changevalue="0%"
    else
    	changevalue="1%"
    fi
}
case $1 in
    up)
	brightness_check
        brightnessctl -d asus::kbd_backlight s +1 > /dev/null
        send_notification
        ;;
    down)
	brightness_check
        brightnessctl -d asus::kbd_backlight s 1- > /dev/null
        send_notification
        ;;
esac
