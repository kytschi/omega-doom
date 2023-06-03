#!/bin/bash

HUD_WIDTH=50
function drawHUD()
{
	cols=`tput cols`
	start_col=$((cols-HUD_WIDTH))

	rows=`tput lines`
	rows=$((rows-1))

	tput cup 5 $start_col
	tput setaf 2

	iLoop=0
	while true; do
		tput cup 0 $((start_col+iLoop))
		printf "="

		tput cup $rows $((start_col+iLoop))
		printf "="

		iLoop=$((iLoop+1))
		if (( iLoop == HUD_WIDTH )); then
			break
		fi
	done

	iLoop=1
	while true; do
		tput cup $iLoop $start_col
		printf "|"

		tput cup $iLoop $((start_col+HUD_WIDTH))
		printf "|"

		iLoop=$((iLoop+1))
		if (( iLoop == rows )); then
				break
		fi
	done

	menu_pad=5

	tput cup 2 $((start_col+menu_pad))
	printf "\e[38;5;15mFUEL\e[0m"

	iLoop=1
	color=196

	while true; do
		tput cup 2 $((start_col+menu_pad+iLoop+5))

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
	OC=208

	start_row=5
	tput cup $start_row $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}mc\e[0m\e[38;5;15m] Communications"

	start_row=$((start_row+1))
	tput cup $start_row $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}mn\e[0m\e[38;5;15m] Navigation"

	start_row=$((start_row+3))
	tput cup $start_row $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}mq\e[0m\e[38;5;15m] Save & Quit"

	# Clear engage
	tput cup 11 $((start_col+menu_pad))
    printf "                              "
}

function drawComms()
{
	tput cup 5 $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}mn\e[0m\e[38;5;15m]\e[38;5;32m Communications\e[0m"

	tput cup 7 $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}mb\e[0m\e[38;5;15m] Back"

	# Draw the current comms menu
	for screen_key in "${!LOCATIONS[@]}"; do
		if  ${LOCATIONS[$screen_key]} ; then
			COMMS_RENDER="comms$screen_key"
			eval "$COMMS_RENDER"
			break
		fi
	done
}

function drawEngage()
{
	tput cup 11 $((start_col+menu_pad))
	printf "\e[38;5;15m[\e[38;5;${OC}me\e[0m\e[38;5;15m] Engage"
}

