# John Abraham, Captain
# Captain of the SS Liberty
function charAbraham()
{
    charDraw $1 $2 $GFX_PATH/characters/ss_liberty/abraham.gfx "Capt. Abraham <SS Liberty>"
}

# Teal Ambrose, Lieutenant
# Communication's officer of the SS Liberty
function charAmbrose()
{
    charDraw $1 $2 $GFX_PATH/characters/ss_liberty/ambrose.gfx "Lt. Ambrose <SS Liberty>"
}

# Jake Cyrus, Lieutenant
# Navigation's officer of the SS Liberty
function charCyrus()
{
    charDraw $1 $2 $GFX_PATH/characters/ss_liberty/cyrus.gfx "Lt. Cyrus <SS Liberty>"
}

# Richard Byrd, Admiral
# Admiral in Federation Command
function charByrd()
{
    charDraw $1 $2 $GFX_PATH/characters/federation_command/byrd.gfx "Adm. Byrd <Federation Command>"
}

# Thomas Thomas, Commander
# Science officer of the SS Liberty
function charThomas()
{
    charDraw $1 $2 $GFX_PATH/characters/ss_liberty/thomas.gfx "Cmdr. Thomas <SS Liberty>"
}

# Paul Simons, Lieutenant
# Weapon's officer of the SS Liberty
function charSimons()
{
    charDraw $1 $2 $GFX_PATH/characters/ss_liberty/simons.gfx "Lt. Simons <SS Liberty>"
}

function charDraw()
{
    x=$1
    y=$2
    
    while IFS= read -r line; do
        tput cup $y $x
        printf '%s\n' "$line"
        y=$((y+1))
    done < $3

    label=$4

    padding=""
    length=${#label}
    length=$((38-length))
    length=$((length/2))
    for (( iLoop=0; iLoop<length; iLoop++ )); do
        padding="$padding "
    done
        
    tput cup $((y-1)) $x
    printf '\e[0;47;30m%s%s%s\e[0m' "$padding $label $padding"
}