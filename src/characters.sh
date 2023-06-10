# John Abraham, Captain
# Captain of the SS Liberty
function charAbraham()
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
# Communication's officer of the SS Liberty
function charAmbrose()
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

# Jake Cyrus, Lieutenant
# Navigation's officer of the SS Liberty
function charCyrus()
{
    x=$1
    y=$2
    while IFS= read -r line; do
        tput cup $y $x
        printf '%s\n' "$line"
        y=$((y+1))
    done < $GFX_PATH/characters/cyrus.gfx
    tput cup $((y-1)) $x
    printf "\e[0;47;30m         Lt. Cyrus <SS Liberty>         \e[0m"
}

# Richard Byrd, Admiral
# Admiral in Federation Command
function charByrd()
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