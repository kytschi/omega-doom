#!/bin/bash

RENDER_PATH=${PWD}
GFX_PATH=$PWD/../../gfx/intro/

rm $GFX_PATH*.gfx
rm $RENDER_PATH/*~

for (( iLoop=1; iLoop<=7; iLoop++ )); do
	src=$RENDER_PATH/game-title$iLoop.png
	desc="game-title$iLoop"

	echo "Rendering ${desc}.gfx"

	convert \
		$src \
		-background none \
		-layers flatten \
		jpg:- | jp2a - --width=100 --color > $GFX_PATH$desc.gfx
done
