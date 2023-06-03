#!/bin/bash

LOCATION_RENDER=""

function drawLocationTitle()
{
	tput cup 2 0

	running=true
	iLoop=1

	color=16

	while $running; do
		echo -e "  \e[38;5;${color}m $LOCATION_TITLE \e[0m"
		printf "\033[A"

		sleep 0.2

		if (( iLoop < 6 )); then
			color=$((color+6))
		else
			color=$((color-6))
		fi

		iLoop=$((iLoop+1))
		if (( iLoop == 6 )); then
			sleep 1
			running=false
		fi

		if (( iLoop == 6 )); then
                        running=false
                fi
	done
}

function drawScreen()
{
	for screen_key in "${!LOCATIONS[@]}"; do
		if  ${LOCATIONS[$screen_key]} ; then
			LOCATION_RENDER="at$screen_key"
			eval "$LOCATION_RENDER"
			break
		fi
	done

	drawLocationTitle
	drawHUD
}

function drawGfx()
{
	tput cup 0 0

	file=$1

	while IFS= read -r line; do
                printf '%s\n' "$line"
        done < $GFX_PATH/$file
}

function engage()
{
	for screen_key in "${!LOCATIONS[@]}"; do
                LOCATIONS[$screen_key]=false
        done

	LOCATIONS[$TO_LOCATION]=true

	tput clear
	tput cup 0 0

	iLoop=0
	angle=0

	while (( iLoop <= 15 )); do
		#convert \
		#	$RENDER_PATH/warp-effect.png \
		#	-background none \
		#	-rotate +${angle} \
		#	-gravity center \
		#	jpg:- | jp2a - --color > $GFX_PATH/warp_effect/$iLoop.gfx

		iLoop2=0
		while IFS= read -r line; do
			tput cup $iLoop2 30
        		printf '%s\n' "$line"
			iLoop2=$((iLoop2+1))
        	done < $GFX_PATH/warp_effect/$iLoop.gfx

		iLoop=$((iLoop+1))
		angle=$((angle+45))
	done
}
