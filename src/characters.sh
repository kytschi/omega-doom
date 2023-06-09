# John Abraham, Captain
# Captain of the SS Liberty
function charAbrahamDraw()
{
    x=$1
    y=$2
    while IFS= read -r line; do
        tput cup $y $x
        printf '%s\n' "$line"
        y=$((y+1))
    done < $GFX_PATH/characters/abraham.gfx
    tput cup $((y-1)) $x
    printf "\e[0;47;30m       Capt. Abraham <SS Liberty>       \e[0m"
}

# Teal Ambrose, Lieutenant
# Communications officer of the SS Liberty
function charAmbroseDraw()
{
    x=$1
    y=$2
    while IFS= read -r line; do
        tput cup $y $x
        printf '%s\n' "$line"
        y=$((y+1))
    done < $GFX_PATH/characters/ambrose.gfx
    tput cup $((y-1)) $x
    printf "\e[0;47;30m        Lt. Ambrose <SS Liberty>        \e[0m"
}

# Richard Byrd, Admiral
# Admiral in Federation Command
function charByrdDraw()
{
    x=$1
    y=$2
    while IFS= read -r line; do
        tput cup $y $x
        printf '%s\n' "$line"
        y=$((y+1))
    done < $GFX_PATH/characters/byrd.gfx
    tput cup $((y-1)) $x
    printf "\e[0;47;30m     Adm. Byrd <Federation Command>     \e[0m"
}