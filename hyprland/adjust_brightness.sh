#!/bin/bash

brightness_breakpoint=10
brightness_cmd="brightnessctl -c backlight"

brightness_data=$($brightness_cmd)
cur_brightness=$(echo $brightness_data | grep -Po "(?<=Current brightness: )[0-9]+")
max_brightness=$(echo $brightness_data | grep -Po "(?<=Max brightness: )[0-9]+")

brightness_percent=$(bc <<<"scale=2; ($cur_brightness / $max_brightness) * 100")
percent_int=${brightness_percent%.*}

if [ $1 = '--dec' ]; then
	[[ $percent_int -le $brightness_breakpoint ]] && adjust_amount=1 || adjust_amount=5
	$brightness_cmd -q s $adjust_amount%-
else
	[[ $percent_int -ge $brightness_breakpoint ]] && adjust_amount=5 || adjust_amount=1
	$brightness_cmd -q s +$adjust_amount%
fi
