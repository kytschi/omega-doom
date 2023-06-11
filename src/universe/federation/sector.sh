#!/bin/bash

function atFederationEarth()
{
	LOCATION_TITLE="EARTH"
	drawGfx "$UNIVERSE_PATH/federation/sector/sol-earth.gfx"
}

function atFederationOutPost3366()
{
	LOCATION_TITLE="Outpost 3366"
	drawGfx "$UNIVERSE_PATH/federation/sector/outpost3366.gfx"
}

function gotoFederationEarth()
{
	AT_LOCATION="atFederationEarth"
	menuItem $((SUB_MENU_START_Y+1)) "1" "Earth" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function gotoFederationOutPost3366()
{
	AT_LOCATION="atFederationOutPost3366"
	menuItem $((SUB_MENU_START_Y+9)) "9" "OutPost 3366" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function menuFederation()
{
	clearSub

	y=$SUB_MENU_START_Y
	menuItem $y "b" "Back" 0
	y=$((y+1))

	menuItem $y "1" "Earth" 0
	SUB_SELECT_ONE="gotoFederationEarth"
	y=$((y+1))

	menuItem $y "9" "OutPost 3366" 0
	SUB_SELECT_NINE="gotoFederationOutPost3366"
}

function drawFederationMap()
{
	start_row=2
	while IFS= read -r line; do
		tput cup $start_row 0

		printf '%s' "$line"

		start_row=$((start_row+1))
	done < $UNIVERSE_PATH/federation/sector/federation-map.gfx

	mapItem 2 4 "Earth" 0
	
	menuFederation
}
