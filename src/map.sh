#!/bin/bash

AT_LOCATION=""
SECTOR_PATH=""

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

	mapControls
}

function mapControls()
{
	clearSub
	menuItem 6 "n" "Navigation" 1
	
	start_row=$SUB_MENU_START_Y
	menuItem $start_row "b" "Back" 0

	start_row=$((start_row+1))
	menuItem $start_row "1" "Kazaria Syndicate" 0
	SUB_SELECT_ONE="drawRosiaEmpireMap"
    
	start_row=$((start_row+1))
	menuItem $start_row "2" "Federation" 0
	SUB_SELECT_TWO="drawRosiaEmpireMap"

	start_row=$((start_row+1))
	menuItem $start_row "3" "Rosia Empire" 0
	SUB_SELECT_THREE="drawRosiaEmpireMap"

	start_row=$((start_row+1))
	menuItem $start_row "4" "Aris Republic" 0
	SUB_SELECT_FOUR="drawRosiaEmpireMap"

	start_row=$((start_row+1))
	menuItem $start_row "5" "Garis Republic" 0
	SUB_SELECT_FIVE="drawRosiaEmpireMap"

	start_row=$((start_row+1))
	menuItem $start_row "6" "Stovacor" 0
	SUB_SELECT_SIX="drawRosiaEmpireMap"

	start_row=$((start_row+1))
	menuItem $start_row "7" "House of Moong" 0
	SUB_SELECT_SEVEN="drawRosiaEmpireMap"
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
