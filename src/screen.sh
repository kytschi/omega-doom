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

MESSAGE_BOX_UP=0
MESSAGE_BOX_BLANK_LINE=""
MESSAGE_TOP_Y=0
function drawMessage()
{
	character=$1
	message=$2
	borderless=$3

	if (( MESSAGE_BOX_UP==0 )); then
		rows=`tput lines`
		rows=$((rows-1))
		cols=`tput cols`
		cols=$((cols-HUD_WIDTH))

		blank_line=""
		line=""
		for (( col=0; col<cols; col++ )); do
			blank_line="$blank_line "
			line="$line="
		done
		for (( row=rows; row>=$((rows-23)); row-- )); do
			if [[ ! $borderless ]];then
				tput cup $((row-1)) 0
				printf "\e[38;5;83m$line\e[0m"
			fi
			tput cup $row 0
			printf "\e[0;47;0m$blank_line\e[0m"
		done

		MESSAGE_BOX_BLANK_LINE=""
		for (( col=0; col<cols-44; col++ )); do
			MESSAGE_BOX_BLANK_LINE="$MESSAGE_BOX_BLANK_LINE "
		done

		MESSAGE_BOX_UP=1
		MESSAGE_TOP_Y=$row
	fi

	eval "char$character 2 $((MESSAGE_TOP_Y+2))"

	y=$((MESSAGE_TOP_Y+10))
	x=44

	tput cup $y $x
	printf "\e[0;47;0m$MESSAGE_BOX_BLANK_LINE\e[0m"

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
	sleep 1
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

	#Cyrus
	drawMessage "Cyrus" "Course plotted sir."

    #Abraham
    drawMessage "Abraham" "Engage."
	MESSAGE_BOX_UP=0

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

	#Cyrus
    drawMessage "Cyrus" "Captain, we've arrive at our destination sir." 1

    #Abraham
    drawMessage "Abraham" "Very well, take us out of warp."

	#Cyrus
    drawMessage "Cyrus" "Dropping to impulse power."
	MESSAGE_BOX_UP=0

	drawScreen
}
