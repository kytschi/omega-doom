#!/bin/bash

current_location="RosiaEmpire"
ZONE_PATH=$UNIVERSE_PATH/rosia-empire

LOCATIONS["${current_location}RosiaPrime"]=true
LOCATIONS["${current_location}Triu"]=false

function atRosiaEmpireRosiaPrime()
{
	LOCATION_TITLE="ROSIA PRIME"
	drawGfx "$ZONE_PATH/sector/rosia-prime.gfx"
}

function atRosiaEmpireTriu()
{
	LOCATION_TITLE="TRIU"
	drawGfx "$ZONE_PATH/sector/triu.gfx"
}

function atRosiaEmpireMortuus()
{
	LOCATION_TITLE="MORTUUS"
	drawGfx "$ZONE_PATH/sector/mortuus.gfx"
}

function atRosiaEmpireGaea()
{
	LOCATION_TITLE="GAEA"
	drawGfx "$ZONE_PATH/sector/gaea.gfx"
}

function atRosiaEmpireElatus()
{
	LOCATION_TITLE="ELATUS"
	drawGfx "$ZONE_PATH/sector/elatus.gfx"
}

function atRosiaEmpireHellhound()
{
	LOCATION_TITLE="HELLHOUND"
	drawGfx "$ZONE_PATH/sector/hellhound.gfx"
}

function atRosiaEmpirePholus()
{
	LOCATION_TITLE="PHOLUS"
	drawGfx "$ZONE_PATH/sector/pholus.gfx"
}

function atRosiaEmpireCrommyon()
{
	LOCATION_TITLE="CROMMYON"
	drawGfx "$ZONE_PATH/sector/crommyon.gfx"
}

function gotoRosiaEmpireRosiaPrime()
{
	GOTO_LOCATION="RosiaEmpireRosiaPrime"
	menuItem $((SUB_MENU_START_Y+1)) "1" "Rosia Prime" 1
	menuEngage $((SUB_MENU_START_Y+3))
}

function menuRosiaEmpire()
{
	clearSub

	menuItem $SUB_MENU_START_Y "b" "Back" 0

	menuItem $((SUB_MENU_START_Y+1)) "1" "Rosia Prime" 0
	SUB_SELECT_ONE="gotoRosiaEmpireRosiaPrime"

	#menuItem $((SUB_MENU_START_Y+2)) "2" "Triu" 0
}

function drawRosiaEmpireMap()
{
	start_row=2
	while IFS= read -r line; do
		tput cup $start_row 0

		printf '%s' "$line"

		start_row=$((start_row+1))
	done < $ZONE_PATH/sector/rosia-empire-map.gfx

	mapItem 2 4 "Rosia Prime" 0
	mapItem 7 60 "Triu" 0
	mapItem 1 110 "Mortuus" 0
	mapItem 17 14 "Gaea" 0
	mapItem 18 104 "Elatus" 0
	mapItem 27 54 "Hellhound" 0
	mapItem 34 22 "Pholus" 0
	mapItem 36 88 "Crommyon" 0

	menuRosiaEmpire
}
