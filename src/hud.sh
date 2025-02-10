#!/bin/bash

HUD_WIDTH=50
HUD_COL=0
MENU_PAD=5
MENU_START_Y=2
SUB_MENU_START_Y=12
SHOW_STATS=1

function drawHUD()
{
	cols=`tput cols`
	HUD_COL=$((cols-HUD_WIDTH))

	rows=`tput lines`
	rows=$((rows-1))

	tput cup 5 $HUD_COL
	
	line=""
	for (( iLoop=1; iLoop<HUD_WIDTH; iLoop++ )); do
		line+=" "
	done
	tput cup 0 $HUD_COL
	printf "\e[38;5;0m$line\e[0m"

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
		printf "\e[38;5;0m$line\e[0m"

		tput cup $iLoop $HUD_COL
		printf "\e[38;5;83m|\e[0m"

		tput cup $iLoop $((HUD_COL+HUD_WIDTH))
		printf "\e[38;5;83m|\e[0m"

		iLoop=$((iLoop+1))
		if (( iLoop == rows )); then
				break
		fi
	done

	end_padding="   "
	start_stats_y=$((rows-10))
	tput cup $start_stats_y $((HUD_COL+MENU_PAD))
	printf "SECTOR    \e[1;37m$LOCATION_SECTOR\e[0m$end_padding" 

	start_stats_y=$((start_stats_y+1))
	tput cup $start_stats_y $((HUD_COL+MENU_PAD))
	printf "LOCATION  \e[1;37m$LOCATION_TITLE\e[0m$end_padding"

	if (( SHOW_STATS== 1 )); then
		updateShields $SHIELDS
	fi
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
	start_stats_y=$((rows-8))
	tput cup $start_stats_y $((HUD_COL+MENU_PAD))

	end_padding="   "

	if (( SHIELDS <= 80 )); then
		printf "SHIELDS   \e[1;36m%d%%\e[0m" $SHIELDS
	elif (( SHIELDS <= 60 )); then
		printf "SHIELDS   \e[1;34m%d%%\e[0m" $SHIELDS
	elif (( SHIELDS <= 40 )); then
		printf "SHIELDS   \e[1;33m%d%%\e[0m" $SHIELDS
	elif (( SHIELDS <= 20 )); then
		printf "SHIELDS   \e[1;31m%d%%\e[0m" $SHIELDS
	else
		printf "SHIELDS   \e[1;32m%d%%\e[0m" $SHIELDS
	fi

	if (( SHIELDS == 0 )); then
		SHIELDS_UP=0
	fi

	if (( SHIELDS_UP == 1)); then
		printf " \e[1;32m[UP]\e[0m  "
	else
		printf " \e[1;31m[DOWN]\e[0m"
	fi

	printf " $end_padding"
}