#!/bin/bash

AT_LOCATION=""

function drawQuadrantMap()
{
	clearView

	start_row=0
	tput cup 0 0

	while IFS= read -r line; do
		tput cup $start_row 0
        printf '%s' "$line"

		start_row=$((start_row+1))
    done < $SRC_PATH/universe/quadrant/alpha.gfx

	start_row=6

	mapItem 3 29 "Kazaria Syndicate" 0 1
	mapItem 12 33 "Federation" 0 2
	mapItem 14 76 "Rosia Empire" 0 3
	mapItem 19 4 "Aris Republic" 0 4
	mapItem 23 45 "Garis Republic" 0 5
	mapItem 25 18 "Stovacor" 0 6
	mapItem 29 45 "House of Moong" 0 7
	mapItem 17 48 "The Void" 0 8

	MENU=("1:Kazaria Syndicate:0" "2:Federation:0" "3:Rosia Empire:0" "4:Aris Republic:0" "5:Garis Republic:0" "6:Stovacor:0" "7:House of Moong:0" "8:The Void:0")
    drawMenu 0 1

	while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[bB])
				eval "$MENU_BACK"
				break
				;;
			[1])
				drawRosiaEmpireMap
				;;
			[2])
				drawFederationMap
				;;
			[3])
				drawFederationMap
				;;
			[4])
				drawFederationMap
				;;
			[5])
				drawFederationMap
				;;
			[6])
				drawFederationMap
				;;
			[7])
				drawFederationMap
				;;
			[8])
				drawFederationMap
				;;
        esac
    done
}

function mapItem()
{
	y=$1
	x=$2
	label=$3
	active=$4
	menu_item=$5

	if ((active==1)); then
		label="\e[38;5;32m$label\e[0m"
	fi

	count=$label
	if ((menu_item)); then
		count="[$menu_item] $label"
		label="\e[38;5;15m[\e[38;5;208m$menu_item\e[0m\e[38;5;15m] $label"
	fi

	line=""
	for (( iLoop=0; iLoop<${#count}; iLoop++ )); do
		line="$line "
	done

	tput cup $y $x
	printf "\e[38;5;0m  $line  "

	tput cup $((y+1)) $x
	printf "\e[38;5;15m  $label  "

	tput cup $((y+2)) $x
	printf "\e[38;5;0m  $line  "
}
