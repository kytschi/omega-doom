#!/bin/bash

tput clear
tput cup 0 0
tput civis

APP=$(dirname "$0")/$(basename "$0")
SYM_PATH=$(readlink -f "$APP")

BASE_PATH=$(echo "$SYM_PATH" | sed "s/\/omega.sh//")
SRC_PATH=$BASE_PATH/src
GFX_PATH=$SRC_PATH/gfx
UNIVERSE_PATH=$SRC_PATH/universe
RENDER_PATH=$SRC_PATH/render

source $SRC_PATH/controls.sh
source $SRC_PATH/hud.sh
source $SRC_PATH/screen.sh

SHIELDS=100
MESSAGE_SPEED=5
MESSAGE_PAUSE=1

# Default story progress
STORY_PROGRESS_FILE=$SRC_PATH/story/intro
STORY_PROGRESS="storyIntroProgress1"

source $SRC_PATH/characters.sh
source $SRC_PATH/ships.sh
source $SRC_PATH/map.sh
source $SRC_PATH/universe/federation/sector.sh
source $SRC_PATH/universe/rosia-empire/sector.sh
source $SRC_PATH/universe/garis-republic/sector.sh

load
drawTitle

tput cnorm