#!/bin/bash

LOCATION_RENDER=""

function drawLocation()
{
	for screen_key in "${!LOCATIONS[@]}"; do
		if  ${LOCATIONS[$screen_key]} ; then
			LOCATION_RENDER="at$screen_key"
			eval "$LOCATION_RENDER"
			break
		fi
	done
}

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

PREV_MESSAGE=""
function drawMessage()
{
	x=$1
	y=$2
	message=" $3 "
	
	tput cup $y $x
	printf "\e[0;40;30m \e[0m"

	length=${#message}
	for (( iLoop=0; iLoop<length; iLoop++ )); do
		tput cup $y $((x+1))
		printf "\e[0;40;30m \e[0m"
		tput cup $y $x
		printf "\e[0;47;30m${message:$iLoop:1}\e[0m"
		x=$((x+1))
		sleep 0.05
	done

	tput cup $y $x
	printf "\e[0;40;0m \e[0m"

	end=${#PREV_MESSAGE}
	end=$((end-length+1))
	for (( iLoop=0; iLoop<end; iLoop++ )); do
		tput cup $y $((x+1))
		printf "\e[0;40;30m \e[0m"
		tput cup $y $x
		printf "\e[0;40;0m \e[0m"
		x=$((x+1))
		sleep 0.05
	done

	tput cup $y $x
	printf "\e[0;40;0m \e[0m"

	PREV_MESSAGE=$message
}

function clearMessage()
{
	x=$1
	y=$2
	message=" $3 "
	
	tput cup $y $x
	printf "\e[0;40;30m \e[0m"

	length=${#message}
	for (( iLoop=0; iLoop<length; iLoop++ )); do
		tput cup $y $((x+1))
		printf "\e[0;40;30m \e[0m"
		tput cup $y $x
		printf "\e[0;47;0m \e[0m"
		x=$((x+1))
	done

	tput cup $y $x
	printf "\e[0;40;0m \e[0m"
}

function clearView()
{
	cols=`tput cols`
	cols=$((cols-HUD_WIDTH))
	rows=`tput lines`
	rows=$((rows-1))

	line=""
	for (( col=0; col<cols; col++ )); do
		line="$line "
	done
	for (( row=0; row<rows; row++ )); do
		tput cup $row 0
		printf "\e[0;47;0m$line\e[0m"
	done
}

function drawScreen()
{
	drawLocation
	drawLocationTitle
	drawHUD
}

function drawGfx()
{
	tput cup 0 0

	file=$1

	while IFS= read -r line; do
		printf '%s\n' "$line"
	done < $file
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

	while (( iLoop <= 15 )); do
		iLoop2=0
		while IFS= read -r line; do
			tput cup $iLoop2 30
        		printf '%s\n' "$line"
			iLoop2=$((iLoop2+1))
        done < $GFX_PATH/warp_effect/$iLoop.gfx

		iLoop=$((iLoop+1))
	done
}
