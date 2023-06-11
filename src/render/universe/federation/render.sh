#!/bin/bash

RENDER_PATH=${PWD}
GFX_PATH=$PWD/../../../universe/federation/sector/

rm $GFX_PATH*.gfx
rm $RENDER_PATH/*.png~
rm $RENDER_PATH/*.kra~

if (( `ls $RENDER_PATH/*.png 2>/dev/null | wc -l` )); then
	for src in $(ls $RENDER_PATH/*.png); do
		src=${src##*/}
		desc=${src/.png/""}

		echo "Rendering $src to ${desc}.gfx"

		if [ $src != "federation-map.png" ]; then
			convert \
				$src \
				-background none \
				-layers flatten \
				jpg:- | jp2a - --width=200 --color > $GFX_PATH$desc.gfx
		else
			convert \
				$src \
				-background none \
				-layers flatten \
				jpg:- | jp2a - --width=130 --color > $GFX_PATH$desc.gfx
		fi
	done
fi
