#!/bin/bash

LOCATION_TITLE=""

function drawLocation()
{
	eval "$AT_LOCATION"
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
MESSAGE_CURRENT_CHAR=""
function drawMessage()
{
	character=$1
	message=" $2 "
	full=$3

	if (( MESSAGE_BOX_UP==0 )); then
		rows=`tput lines`
		rows=$((rows-1))
		cols=`tput cols`
		if [[ ! $full ]];then
			cols=$((cols-HUD_WIDTH))
		fi
		
		blank_line=""
		line=""
		for (( col=0; col<cols; col++ )); do
			blank_line="$blank_line "
			line="$line="
		done

		for (( row=rows; row>=$((rows-23)); row-- )); do
			tput cup $((row-1)) 0
			printf "\e[38;5;83m$line\e[0m"

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

	if [ "$MESSAGE_CURRENT_CHAR" != "$character" ]; then
		MESSAGE_CURRENT_CHAR=$character
		eval "char$character 2 $((MESSAGE_TOP_Y+2))"
	fi

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
		sleep $MESSAGE_SPEED
	done

	tput cup $y $x
	printf "\e[0;40;0m \e[0m"
	sleep 1
}

function clearView()
{
	MESSAGE_BOX_UP=0
	
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

SCREEN_REDRAW=1
function drawScreen()
{
	if (( SCREEN_REDRAW==1 )); then
		MESSAGE_BOX_UP=0
		tput clear
		tput cup 0 0
		drawLocation
		drawLocationTitle
		drawHUD
	fi
}

function drawTitle()
{
	rows=`tput lines`
	cols=`tput cols`
    x=$((cols/3))
    x=$((x-13))
    
	for (( iLoop=1; iLoop<=7; iLoop++ )); do
		y=5
		while IFS= read -r line; do
			tput cup $y $x
			printf '%s\n' "$line"
			y=$((y+1))
		done < $GFX_PATH/intro/game-title$iLoop.gfx
		sleep 0.5
	done
	for (( iLoop=7; iLoop>=1; iLoop-- )); do
		y=5
		while IFS= read -r line; do
			tput cup $y $x
			printf '%s\n' "$line"
			y=$((y+1))
		done < $GFX_PATH/intro/game-title$iLoop.gfx
		sleep 0.5
	done
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

	progressStory
}

function progressStory()
{
	source $STORY_PROGRESS_FILE.sh
	eval "$STORY_PROGRESS"
}