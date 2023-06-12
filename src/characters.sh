# John Abrahams, Captain
# Captain of the SS Liberty
function charAbrahams()
{
    charDraw $1 $2 $GFX_PATH/characters/ss_liberty/abrahams.gfx "Capt. Abrahams <SS Liberty> "
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
    charDraw $1 $2 $GFX_PATH/characters/ss_liberty/thomas.gfx "Cmdr. Thomas <SS Liberty> "
}

# Paul Simons, Lieutenant
# Weapon's officer of the SS Liberty
function charSimons()
{
    charDraw $1 $2 $GFX_PATH/characters/ss_liberty/simons.gfx "Lt. Simons <SS Liberty> "
}

# Jonathan Peters, Chief Engineer 
# Chief of engineering of the SS Liberty
function charPeters()
{
    charDraw $1 $2 $GFX_PATH/characters/ss_liberty/peters.gfx "Chief Peters <SS Liberty> "
}

# Taki
# Inmate at Garis Republic Penal Colony
function charTaki()
{
    charDraw $1 $2 $GFX_PATH/characters/garis_republic_penal_colony/taki.gfx " Taki <cellmate> "
}

# Jake Abrahams
function charJake()
{
    charDraw $1 $2 $GFX_PATH/characters/omega_doom/jake.gfx "Jake"
}

# Prison Guard
function charGRPCPrisonGuard()
{
    charDraw $1 $2 $GFX_PATH/characters/garis_republic_penal_colony/prison-guard.gfx "Prison Guard"
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