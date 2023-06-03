#!/bin/bash

clear
tput civis

APP=$(dirname "$0")/$(basename "$0")
SYM_PATH=$(readlink -f "$APP")

BASE_PATH=$(echo "$SYM_PATH" | sed "s/\/omega.sh//")
SRC_PATH=$BASE_PATH/src
TMP_PATH=$BASE_PATH/.tmp
GFX_PATH=$SRC_PATH/gfx
UNIVERSE_PATH=$SRC_PATH/universe
RENDER_PATH=$SRC_PATH/render

source $SRC_PATH/controls.sh
source $SRC_PATH/hud.sh
source $SRC_PATH/screen.sh

declare -A LOCATIONS
TO_LOCATION=""
COMMS_MENU=""

SCREEN_WIDTH=640
SCREEN_HEIGHT=480

LOCATION_TITLE=""
NEW_LOCATION=true
PLAYER_X=0 #$(( SCREEN_WIDTH / 1 ))
PLAYER_Y=0 #$(( SCREEN_HEIGHT / 1 ))
FUEL=32

source $SRC_PATH/map.sh
source $SRC_PATH/universe/sawous-empire/zone.sh

drawScreen
controls

# Clean up
rm $TMP_PATH/*.png 2> /dev/null

tput cnorm
