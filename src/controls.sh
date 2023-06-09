#!/bin/bash

SUB_SELECT_ONE="";
function controls()
{
	while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[cC])
				drawComms
				
				clear
				drawScreen
				;;
			[nN])
				drawGalaxyMap
				mapControls

				clear
				drawScreen
				;;
			[qQ])
				quit
				;;
			[1])
				eval "$SUB_SELECT_ONE"
				;;
		esac
	done
}

function quit()
{
	clear
	tput cup 0 0
	echo "Good-bye"
	tput cnorm
	exit 1
}
