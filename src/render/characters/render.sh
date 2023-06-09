#!/bin/bash

RENDER_PATH=${PWD}
GFX_PATH=$PWD/../../gfx/characters/

if (( `ls $RENDER_PATH/*.png 2>/dev/null | wc -l` )); then
	for src in $(ls $RENDER_PATH/*.png); do
		src=${src##*/}
		desc=${src/.png/""}

		convert \
			$src \
			-background none \
			-layers flatten \
			jpg:- | jp2a - --width=40 --color > $GFX_PATH$desc.gfx
	done
fi
