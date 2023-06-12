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

	mapItem 10 54 "Kazaria Syndicate" 0
	mapItem 21 56 "Federation" 0
	mapItem 24 103 "Rosia Empire" 0
	mapItem 36 72 "Aris Republic" 0
	mapItem 44 70 "Garis Republic" 0
	mapItem 39 46 "Stovacor" 0
	mapItem 30 30 "House of Moong" 0
	mapItem 28 74 "The Void" 0

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

	if ((active==1)); then
		label="\e[38;5;32m$label\e[0m"
	fi

	line=""
	for (( iLoop=0; iLoop<${#label}; iLoop++ )); do
		line="$line "
	done

	tput cup $y $x
	printf "\e[38;5;0m  $line  "

	tput cup $((y+1)) $x
	printf "\e[38;5;15m  $label  "

	tput cup $((y+2)) $x
	printf "\e[38;5;0m  $line  "
}
