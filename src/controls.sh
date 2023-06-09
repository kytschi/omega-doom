#!/bin/bash
function controls()
{
	while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[bB])
				drawScreen
				;;
			[cC])
				menuComms
				;;
			[nN])
				clearComms
				drawQuadrantMap
				mapControls
				;;
			[eE])
				engage
				;;
			[qQ])
				quit
				;;
			[1])
				eval "$SUB_SELECT_ONE"
				;;
			[2])
				eval "$SUB_SELECT_TWO"
				;;
			[3])
				eval "$SUB_SELECT_THREE"
				;;
			[4])
				eval "$SUB_SELECT_FOUR"
				;;
			[5])
				eval "$SUB_SELECT_FIVE"
				;;
			[6])
				eval "$SUB_SELECT_SIX"
				;;
			[7])
				eval "$SUB_SELECT_SEVEN"
				;;
			[8])
				eval "$SUB_SELECT_EIGHT"
				;;
			[9])
				eval "$SUB_SELECT_NINE"
				;;
		esac
	done
}

function quit()
{
	tput clear
	tput cup 0 0
	echo "Good-bye"
	tput cnorm
	exit 1
}
