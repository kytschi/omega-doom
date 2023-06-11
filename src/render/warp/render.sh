#!/bin/bash

iLoop=0
angle=0

rm *.png~
rm *.kra~

while (( iLoop <= 15 )); do
    convert \
    	warp-effect.png \
    	-background none \
    	-rotate +${angle} \
    	-gravity center \
    	jpg:- | jp2a - --color > $GFX_PATH/warp_effect/$iLoop.gfx

    iLoop=$((iLoop+1))
    angle=$((angle+45))
done