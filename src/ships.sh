function shipOmegaDoomExteria()
{
	LOCATION_TITLE="OMEGA DOOM"
	drawGfx $GFX_PATH/ships/omega_doom/omega_doom_exteria.gfx
}

function shipOmegaDoomExteriaBlinkAppear()
{
	iLoop=1
	while (( iLoop <= 5 )); do
		iLoop2=0
		while IFS= read -r line; do
			tput cup $iLoop2 0
        		printf '%s\n' "$line"
			iLoop2=$((iLoop2+1))
        done < $GFX_PATH/ships/omega_doom/omega_doom_exteria_blink$iLoop.gfx

		iLoop=$((iLoop+1))
	done
	drawGfx $GFX_PATH/ships/omega_doom/omega_doom_exteria.gfx

	if [ -z ${1+x} ]; then
		drawLocationTitle
	fi
}

function shipOmegaDoomExteriaBlinkFire()
{
	#shipOmegaDoomExteriaBlinkFireCharging
	iLoop=3
	while (( iLoop <= 5 )); do
		iLoop2=0
		while IFS= read -r line; do
			tput cup $iLoop2 0
        		printf '%s\n' "$line"
			iLoop2=$((iLoop2+1))
        done < $GFX_PATH/ships/omega_doom/omega_doom_exteria_blink_fire$iLoop.gfx
		iLoop=$((iLoop+1))
	done
	drawGfx $GFX_PATH/ships/omega_doom/omega_doom_exteria.gfx
	
	if [ -z ${1+x} ]; then
		drawLocationTitle
	fi
}

function shipOmegaDoomExteriaBlinkFireCharging()
{
	iLoop=1
	iLoop3=1
	while (( iLoop <= 10 )); do
		iLoop2=0
		while IFS= read -r line; do
			tput cup $iLoop2 0
        		printf '%s\n' "$line"
			iLoop2=$((iLoop2+1))
        done < $GFX_PATH/ships/omega_doom/omega_doom_exteria_blink_fire$iLoop3.gfx
		iLoop=$((iLoop+1))
		if (( iLoop3==1 )); then
			iLoop3=2
		else
			iLoop3=1
		fi
	done
	
	if [ -z ${1+x} ]; then
		drawLocationTitle
	fi
}