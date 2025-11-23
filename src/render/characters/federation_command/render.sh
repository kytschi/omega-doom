#!/bin/bash

RENDER_PATH=${PWD}
GFX_PATH=$PWD/../../../gfx/characters/federation_command/

rm $GFX_PATH*.gfx 2> /dev/null
rm $RENDER_PATH/*.png~ 2> /dev/null
rm $RENDER_PATH/*.kra~ 2> /dev/null

if (( `ls $RENDER_PATH/*.png 2>/dev/null | wc -l` )); then
	for src in $(ls $RENDER_PATH/*.png); do
		src=${src##*/}
		desc=${src/.png/""}

		echo "Rendering $src to $desc.gfx"

		convert \
			$src \
			-background none \
			-layers flatten \
			jpg:- | jp2a - --width=40 --color > $GFX_PATH$desc.gfx
	done
fi
