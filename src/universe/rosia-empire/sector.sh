#!/bin/bash

GOTO_LOCATION="RosiaEmpireOutPost3366"
ZONE_PATH=$UNIVERSE_PATH/rosia-empire

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

function atRosiaEmpireOutPost3366()
{
	LOCATION_TITLE="Outpost 3366"
	drawGfx "$ZONE_PATH/sector/outpost3366.gfx"
}

function gotoRosiaEmpireRosiaPrime()
{
	GOTO_LOCATION="RosiaEmpireRosiaPrime"
	menuItem $((SUB_MENU_START_Y+1)) "1" "Rosia Prime" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function gotoRosiaEmpireTriu()
{
	GOTO_LOCATION="RosiaEmpireTriu"
	menuItem $((SUB_MENU_START_Y+2)) "2" "Triu" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function gotoRosiaEmpireMortuus()
{
	GOTO_LOCATION="RosiaEmpireMortuus"
	menuItem $((SUB_MENU_START_Y+3)) "3" "Mortuus" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function gotoRosiaEmpireGaea()
{
	GOTO_LOCATION="RosiaEmpireGaea"
	menuItem $((SUB_MENU_START_Y+4)) "4" "Gaea" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function gotoRosiaEmpireElatus()
{
	GOTO_LOCATION="RosiaEmpireElatus"
	menuItem $((SUB_MENU_START_Y+5)) "5" "Elatus" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function gotoRosiaEmpireHellhound()
{
	GOTO_LOCATION="RosiaEmpireHellhound"
	menuItem $((SUB_MENU_START_Y+6)) "6" "Hellhound" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function gotoRosiaEmpirePholus()
{
	GOTO_LOCATION="RosiaEmpirePholus"
	menuItem $((SUB_MENU_START_Y+7)) "7" "Pholus" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function gotoRosiaEmpireCrommyon()
{
	GOTO_LOCATION="RosiaEmpireCrommyon"
	menuItem $((SUB_MENU_START_Y+8)) "8" "Crommyon" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function gotoRosiaEmpireOutPost3366()
{
	GOTO_LOCATION="RosiaEmpireOutPost3366"
	menuItem $((SUB_MENU_START_Y+9)) "9" "OutPost 3366" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function menuRosiaEmpire()
{
	clearSub

	menuItem $SUB_MENU_START_Y "b" "Back" 0

	menuItem $((SUB_MENU_START_Y+1)) "1" "Rosia Prime" 0
	SUB_SELECT_ONE="gotoRosiaEmpireRosiaPrime"

	menuItem $((SUB_MENU_START_Y+2)) "2" "Triu" 0
	SUB_SELECT_TWO="gotoRosiaEmpireTriu"

	menuItem $((SUB_MENU_START_Y+3)) "3" "Mortuus" 0
	SUB_SELECT_THREE="gotoRosiaEmpireMortuus"

	menuItem $((SUB_MENU_START_Y+4)) "4" "Gaea" 0
	SUB_SELECT_FOUR="gotoRosiaEmpireGaea"

	menuItem $((SUB_MENU_START_Y+5)) "5" "Elatus" 0
	SUB_SELECT_FIVE="gotoRosiaEmpireElatus"

	menuItem $((SUB_MENU_START_Y+6)) "6" "Hellhound" 0
	SUB_SELECT_SIX="gotoRosiaEmpireHellhound"

	menuItem $((SUB_MENU_START_Y+7)) "7" "Pholus" 0
	SUB_SELECT_SEVEN="gotoRosiaEmpirePholus"

	menuItem $((SUB_MENU_START_Y+8)) "8" "Crommyon" 0
	SUB_SELECT_EIGHT="gotoRosiaEmpireCrommyon"

	menuItem $((SUB_MENU_START_Y+9)) "9" "OutPost 3366" 0
	SUB_SELECT_NINE="gotoRosiaEmpireOutPost3366"
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
	mapItem 15 100 "Elatus" 0
	mapItem 27 54 "Hellhound" 0
	mapItem 34 22 "Pholus" 0
	mapItem 36 80 "Crommyon" 0
	mapItem 35 108 "Outpost 3366" 0

	menuRosiaEmpire
}
