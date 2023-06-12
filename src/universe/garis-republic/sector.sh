#!/bin/bash

function atGarisRepublicPenalColony()
{
	LOCATION_TITLE="PENAL COLONY"
	drawGfx "$UNIVERSE_PATH/garis-republic/sector/penal-colony.gfx"
}

function gotoGarisRepublicPenalColony()
{
	AT_LOCATION="atGarisRepublicPenalColony"
	menuItem $((SUB_MENU_START_Y+1)) "1" "Penal Colony" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function menuGarisRepublic()
{
	MENU_BACK="progressStory"
	menuItem $SUB_MENU_START_Y "b" "Back" 0

	menuItem $((SUB_MENU_START_Y+1)) "1" "Penal Colony" 0
	SUB_SELECT_ONE="gotoGarisRepublicPenalColony"
}

function drawGarisRepublicMap()
{
	clearView
	start_row=2
	while IFS= read -r line; do
		tput cup $start_row 0
		printf '%s' "$line"
		start_row=$((start_row+1))
	done < $UNIVERSE_PATH/garis-republic/sector/garis-republic-map.gfx

	mapItem 2 4 "Penal Colony" 0
	
	menuGarisRepublic
}
