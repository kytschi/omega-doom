#!/bin/bash

HUD_WIDTH=50
HUD_COL=0
MENU_PAD=5
MENU_START_Y=5
SUB_MENU_START_Y=12

function drawHUD()
{
	cols=`tput cols`
	HUD_COL=$((cols-HUD_WIDTH))

	rows=`tput lines`
	rows=$((rows-1))

	tput cup 5 $HUD_COL
	
	iLoop=0
	while true; do
		tput cup 0 $((HUD_COL+iLoop))
		printf "\e[38;5;83m=\e[0m"

		tput cup $rows $((HUD_COL+iLoop))
		printf "\e[38;5;83m=\e[0m"

		iLoop=$((iLoop+1))
		if (( iLoop == HUD_WIDTH )); then
			break
		fi
	done

	iLoop=1
	while true; do
		tput cup $iLoop $HUD_COL
		printf "\e[38;5;83m|\e[0m"

		tput cup $iLoop $((HUD_COL+HUD_WIDTH))
		printf "\e[38;5;83m|\e[0m"

		iLoop=$((iLoop+1))
		if (( iLoop == rows )); then
				break
		fi
	done

	updateShields $SHIELDS
}

MENU=()
function drawMenu()
{
	tput cup 0 0

	with_save=$1
	with_back=$2

	line=""
	for (( col=0; col<HUD_WIDTH-MENU_PAD-2; col++ )); do
		line="$line "
	done

	rows=10	
	for (( row=0; row<rows; row++ )); do
		tput cup $((MENU_START_Y+row)) $((HUD_COL+MENU_PAD))
		printf "\e[0;47;0m$line\e[0m"
	done

	start_row=$MENU_START_Y

	if (( $with_back==1 ));then
		menuItem $start_row "b" "Back" 0
		start_row=$((start_row+1))
	fi

	for key in ${!MENU[@]}; do
		IFS=':'
		read -a splits <<< ${MENU[$key]}

		menuItem $start_row ${splits[0]} ${splits[1]} ${splits[2]}
		start_row=$((start_row+1))
	done

	if (( $with_save==1 )); then
		menuItem $start_row "q" "Save & Quit" 0
	fi
}

function menuEngage()
{
	tput cup $1 $((HUD_COL+MENU_PAD))
	printf "\e[38;5;15m[\e[38;5;208me\e[0m\e[38;5;15m] \e[33;5;15mEngage\e[0m"
}

function clearEngage()
{
	tput cup $1 $((HUD_COL+MENU_PAD))
	printf "                                      "
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

function updateShields()
{
	SHIELDS=$1
	tput cup 2 $((HUD_COL+MENU_PAD))
	if (( SHIELDS < 10 )); then
		printf '\e[38;5;83mSHIELDS\e[0m \e[0;91m%d%%\e[0m' "$SHIELDS"
	else
		printf '\e[38;5;83mSHIELDS\e[0m %d%%' "$SHIELDS"
	fi
}