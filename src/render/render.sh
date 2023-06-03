#!/bin/bash

RENDER_PATH=${PWD}
GFX_PATH=$PWD/../gfx/

if (( `ls $RENDER_PATH/*.png 2>/dev/null | wc -l` )); then
	for src in $(ls $RENDER_PATH/*.png); do
		src=${src##*/}

		if [ $src != "ship.png" ]; then
        	desc=${src/.png/""}

			echo "Rendering $src to ${desc}.gfx"

			if [ $src != "logo.png" ]; then
				convert \
					$src \
					-background none \
					-layers flatten \
					jpg:- | jp2a - --color > $GFX_PATH$desc.gfx
			else
				convert \
					$src \
					-background none \
					-layers flatten \
					jpg:- | jp2a - --color > $GFX_PATH$desc.gfx

			fi
		fi
	done
fi
