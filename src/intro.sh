#!/bin/bash

function drawIntro()
{
    rows=`tput lines`
	cols=`tput cols`
    x=$((cols/3))
    x=$((x-13))
    
    for (( iLoop=1; iLoop<=7; iLoop++ )); do
        y=5
        while IFS= read -r line; do
            tput cup $y $x
            printf '%s\n' "$line"
            y=$((y+1))
        done < $GFX_PATH/intro/game-title$iLoop.gfx
        sleep 0.5
    done
    for (( iLoop=7; iLoop>=1; iLoop-- )); do
        y=5
        while IFS= read -r line; do
            tput cup $y $x
            printf '%s\n' "$line"
            y=$((y+1))
        done < $GFX_PATH/intro/game-title$iLoop.gfx
        sleep 0.5
    done

    drawScreen
    controls
}