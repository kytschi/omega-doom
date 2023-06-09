#!/bin/bash

HUD_WIDTH=50
HUD_COL=0
MENU_PAD=5
MENU_START_Y=5
SUB_MENU_START_Y=12

SUB_SELECT_MENU=""
SUB_SELECT_ONE=""
SUB_SELECT_TWO=""
SUB_SELECT_THREE=""
SUB_SELECT_FOUR=""
SUB_SELECT_FIVE=""
SUB_SELECT_SIX=""
SUB_SELECT_SEVEN=""
SUB_SELECT_EIGHT=""
SUB_SELECT_NINE=""

function drawHUD()
{
	cols=`tput cols`
	HUD_COL=$((cols-HUD_WIDTH))

	rows=`tput lines`
	rows=$((rows-1))

	tput cup 5 $HUD_COL
	tput setaf 2

	iLoop=0
	while true; do
		tput cup 0 $((HUD_COL+iLoop))
		printf "="

		tput cup $rows $((HUD_COL+iLoop))
		printf "="

		iLoop=$((iLoop+1))
		if (( iLoop == HUD_WIDTH )); then
			break
		fi
	done

	iLoop=1
	while true; do
		tput cup $iLoop $HUD_COL
		printf "|"

		tput cup $iLoop $((HUD_COL+HUD_WIDTH))
		printf "|"

		iLoop=$((iLoop+1))
		if (( iLoop == rows )); then
				break
		fi
	done

	tput cup 2 $((HUD_COL+MENU_PAD))
	printf "\e[38;5;15mFUEL\e[0m"

	iLoop=1
	color=196

	while true; do
		tput cup 2 $((HUD_COL+MENU_PAD+iLoop+5))

		printf "\e[38;5;${color}m:\e[0m"

		if (( iLoop >= 11 && iLoop < 22 )); then
			color=214
		elif (( iLoop >= 22 )); then
			color=83
		fi

		if (( iLoop == FUEL )); then
			break
		fi
		iLoop=$((iLoop+1))
	done

	tput setaf 1
	drawMenu
}

function drawMenu()
{
	start_row=$MENU_START_Y
	menuItem $start_row "c" "Communications" 0

	start_row=$((start_row+1))
	menuItem $start_row "n" "Navigation" 0
	
	start_row=$((start_row+1))
	menuItem $start_row "q" "Save & Quit" 0
	
	# Clear engage
	tput cup 11 $((HUD_COL+MENU_PAD))
    printf "                              "
}

function menuComms()
{
	menuItem $MENU_START_Y "c" "Communications" 1
	
	if [ !"$SUB_SELECT_MENU" ]; then
		eval "$SUB_SELECT_MENU"
	fi
}

function clearComms()
{
	menuItem $MENU_START_Y "c" "Communications" 0
	clearSub
}

function menuEngage()
{
	tput cup $1 $((HUD_COL+MENU_PAD))
	printf "\e[38;5;15m[\e[38;5;208me\e[0m\e[38;5;15m] \e[33;5;15mEngage\e[0m"
}

PREV_MENU_Y=0
function menuItem()
{
	y=$1
	button=$2
	label=$3
	active=$4
	flash=$5

	if ((active==1)); then
		label="\e[38;5;32m$label\e[0m"
	fi

	if ((flash)); then
		label="\e[33;5;15m$label\e[0m"
	fi

	tput cup $y $((HUD_COL+MENU_PAD))
	printf "\e[38;5;15m[\e[38;5;208m$button\e[0m\e[38;5;15m] $label"

	PREV_MENU_Y=$y
}

function clearSub()
{
	SUB_SELECT_ONE=""
	SUB_SELECT_TWO=""
	SUB_SELECT_THREE=""
	SUB_SELECT_FOUR=""
	SUB_SELECT_FIVE=""
	SUB_SELECT_SIX=""
	SUB_SELECT_SEVEN=""
	SUB_SELECT_EIGHT=""
	SUB_SELECT_NINE=""

	line=""
	for (( col=0; col<HUD_WIDTH; col++ )); do
		line="$line "
	done

	rows=10	
	for (( row=0; row<rows; row++ )); do
		tput cup $((SUB_MENU_START_Y+row)) $((HUD_COL+MENU_PAD))
		printf "\e[0;47;0m$line\e[0m"
	done
}
