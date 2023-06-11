#!/bin/bash

function atRosiaEmpireRosiaPrime()
{
	LOCATION_TITLE="ROSIA PRIME"
	drawGfx "$UNIVERSE_PATH/rosia-empire/sector/rosia-prime.gfx"
}

function atRosiaEmpireTriu()
{
	LOCATION_TITLE="TRIU"
	drawGfx "$UNIVERSE_PATH/rosia-empire/sector/triu.gfx"
}

function atRosiaEmpireMortuus()
{
	LOCATION_TITLE="MORTUUS"
	drawGfx "$UNIVERSE_PATH/rosia-empire/sector/mortuus.gfx"
}

function atRosiaEmpireGaea()
{
	LOCATION_TITLE="GAEA"
	drawGfx "$UNIVERSE_PATH/rosia-empire/sector/gaea.gfx"
}

function atRosiaEmpireElatus()
{
	LOCATION_TITLE="ELATUS"
	drawGfx "$UNIVERSE_PATH/rosia-empire/sector/elatus.gfx"
}

function atRosiaEmpireHellhound()
{
	LOCATION_TITLE="HELLHOUND"
	drawGfx "$UNIVERSE_PATH/rosia-empire/sector/hellhound.gfx"
}

function atRosiaEmpirePholus()
{
	LOCATION_TITLE="PHOLUS"
	drawGfx "$UNIVERSE_PATH/rosia-empire/sector/pholus.gfx"
}

function atRosiaEmpireCrommyon()
{
	LOCATION_TITLE="CROMMYON"
	drawGfx "$UNIVERSE_PATH/rosia-empire/sector/crommyon.gfx"
}

function gotoRosiaEmpireRosiaPrime()
{
	AT_LOCATION="atRosiaEmpireRosiaPrime"
	menuItem $((SUB_MENU_START_Y+1)) "1" "Rosia Prime" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function gotoRosiaEmpireTriu()
{
	AT_LOCATION="atRosiaEmpireTriu"
	menuItem $((SUB_MENU_START_Y+2)) "2" "Triu" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function gotoRosiaEmpireMortuus()
{
	AT_LOCATION="atRosiaEmpireMortuus"
	menuItem $((SUB_MENU_START_Y+3)) "3" "Mortuus" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function gotoRosiaEmpireGaea()
{
	AT_LOCATION="atRosiaEmpireGaea"
	menuItem $((SUB_MENU_START_Y+4)) "4" "Gaea" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function gotoRosiaEmpireElatus()
{
	AT_LOCATION="atRosiaEmpireElatus"
	menuItem $((SUB_MENU_START_Y+5)) "5" "Elatus" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function gotoRosiaEmpireHellhound()
{
	AT_LOCATION="atRosiaEmpireHellhound"
	menuItem $((SUB_MENU_START_Y+6)) "6" "Hellhound" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function gotoRosiaEmpirePholus()
{
	AT_LOCATION="atRosiaEmpirePholus"
	menuItem $((SUB_MENU_START_Y+7)) "7" "Pholus" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function gotoRosiaEmpireCrommyon()
{
	AT_LOCATION="atRosiaEmpireCrommyon"
	menuItem $((SUB_MENU_START_Y+8)) "8" "Crommyon" 1
	menuEngage $((SUB_MENU_START_Y+10))
}

function menuRosiaEmpire()
{
	clearSub

	MENU_BACK="progressStory"
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
}

function drawRosiaEmpireMap()
{
	clearView
	start_row=2
	while IFS= read -r line; do
		tput cup $start_row 0

		printf '%s' "$line"

		start_row=$((start_row+1))
	done < $UNIVERSE_PATH/rosia-empire/sector/rosia-empire-map.gfx

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
