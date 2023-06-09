#!/bin/bash

function drawLocation()
{
	for screen_key in "${!LOCATIONS[@]}"; do
		if  ${LOCATIONS[$screen_key]} ; then
			eval "at$screen_key"
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
	tput clear
	tput cup 0 0
	drawLocation
	drawLocationTitle
	drawHUD
}

function drawTitle()
{
	tput cup 1 0
	echo -e "  \e[38;5;${color}m Rosia Empire \e[0m"
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

	LOCATIONS[$GOTO_LOCATION]=true

	char_one_x=2
    char_one_text_x=43
    char_one_y=6
    char_one_text_y=17

	char_two_x=100
    char_two_text_x=89
    char_two_y=20
    char_two_text_y=32

    charCyrusDraw $char_one_x $char_one_y
	charAbrahamDraw $char_two_x $char_two_y

	#Cyrus
	PREV_MESSAGE=""
    drawMessage $char_one_text_x $char_one_text_y "Course plotted sir."

    #Abraham
	PREV_MESSAGE=""
    drawMessage $char_two_text_x $char_two_text_y "Engage."
    sleep 1

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

	charCyrusDraw $char_one_x $char_one_y
	charAbrahamDraw $char_two_x $char_two_y

	#Cyrus
    drawMessage $char_one_text_x $char_one_text_y "Captain, we've arrive at our destination sir."

    #Abraham
    char_two_text_x=65
	PREV_MESSAGE=""
    drawMessage $char_two_text_x $char_two_text_y "Very well, take us out of warp."

	#Cyrus
	PREV_MESSAGE="Captain, we've arrive at our destination sir."
    drawMessage $char_one_text_x $char_one_text_y "Dropping to impulse power."
    sleep 1

	drawScreen
}
