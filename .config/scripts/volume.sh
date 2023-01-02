#!/bin/sh
set -eu
# You can call this script like this:
# $./volume.sh up
# $./volume.sh down
# $./volume.sh mute

# output
# use the following option for pulseaudio
#output_name="pulse"
# use the following option for alsa
output_name="default"



get_volume () {
    amixer get Master | grep '%' | head -n 1 | cut -d '[' -f 2 | cut -d '%' -f 1
}

is_mute () {
    amixer get Master | grep '%' | grep -oE '[^ ]+$' | grep off > /dev/null
}

send_notification () {
    # Send the notification
    dunstify -t 1600 -h string:x-dunst-stack-tag:volume -u normal "Volume" -h int:value:"$(get_volume)"
}

case $1 in
    up)
	# Set the volume on (if it was muted)
	amixer -q -D "$output_name" set Master on > /dev/null
	# Up the volume (+ 5%)
	amixer -q -D "$output_name" sset Master 5%+ > /dev/null
	send_notification
	;;
    down)
	amixer -q -D "$output_name" set Master on > /dev/null
	amixer -q -D "$output_name" sset Master 5%- > /dev/null
	send_notification
	;;
    mute)
    	# Toggle mute
	amixer -q -D "$output_name" set Master 1+ toggle > /dev/null
	if is_mute ; then
	    dunstify -t 1600 -h string:x-dunst-stack-tag:volume -u normal "Mute"
	else
	    send_notification
	fi
	;;
esac

