# !/bin/bash
PHPLASMA=0
PHPLASMA_FUMES=0
function storyPenalColonyProgress5()
{   
    HIDE_HUD=1
    SHOW_STATS=0

    LOCATION_SECTOR=""
    AT_LOCATION="atGarisRepublicPenalColonyHole"

    tput clear
    animateTitle "Like a hole in the head..." 1

    SCREEN_REDRAW=1
    drawScreen
    SCREEN_REDRAW=0
    HIDE_HUD=0

	drawMessage "GRPCPrisonGuard" "In you go Abrahams..." 1
    drawMessage "GRPCPrisonGuard" "See you in 30 days, enjoy."
    
    drawMessage "Jake" "Thanks boss but I'll be out of there by the end of the night!"
    drawMessage "GRPCPrisonGuard" "HAHAHA, sure you will...HAHAHAHA!"

    drawMessage "Jake" "I watch the guard close the hatch in the door." 1 1
    drawMessage "Jake" "Then I hear him walk down the hall locking the outer gate." 1 1
    drawMessage "Jake" "OK, now I need to signal my ship I'm ready." 1 1
    
    drawHUD
    MESSAGE_BOX_UP=0

    storyPenalColonyProgress5Menu
}

function storyPenalColonyProgress5Menu()
{
    MENU=("1:Look around the room:0" "2:Call out to the guard:0" "3:Talk to prisoner next door:0")
    drawMenu 1 0
    MESSAGE_BOX_UP=1
        
    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[1])
				storyPenalColonyProgress5Dialog1
				;;
            [2])
				storyPenalColonyProgress5Dialog2
				;;
            [3])
				storyPenalColonyProgress5Dialog3
				;;
			[qQ])
				save
				quitMenu
				;;
        esac
    done
}

function storyPenalColonyProgress5Plasma()
{
    if (( PHPLASMA==1 )); then
        PHPLASMA_FUMES=$((PHPLASMA_FUMES+1))
        if (( PHPLASMA_FUMES<=2 )); then
            drawMessage "Jake" "I need to be quick as the room is filling with toxic plasma fumes!"
        elif (( PHPLASMA_FUMES<=4 )); then
            drawMessage "Jake" "*COUGH* *COUGH*"
            drawMessage "Jake" "Man these plasma fumes are really starting to hurt!"
        elif (( PHPLASMA_FUMES<=6 )); then
            drawMessage "Jake" "*COUGH* *COUGH* *COUGH* *COUGH*"
            drawMessage "Jake" "I'm starting to black out...can't take much more of these fumes!"
        else
            drawMessage "Jake" "*COUGH* *COUGH* *COLLAPSE*"
            gameover "Jake died from the plasma fumes!"
        fi
    fi    
}

function storyPenalColonyProgress5Dialog1()
{
    menuItem $((MENU_START_Y)) "1" "Look around the room" 1

    drawMessage "Jake" "OK, lets see what I can use in this room." 0 1
    drawMessage "Jake" "There's a large pipe to the left running the full length of the cell." 0 1
    drawMessage "Jake" "A bucket in the middle of the room at the top." 0 1
    drawMessage "Jake" "Running down the middle of the ceiling is a huge white strip light." 0 1
    drawMessage "Jake" "There is some sort of panel on the rear wall." 0 1
    drawMessage "Jake" "And of course the blanket I was given to sleep on, no bed." 0 1 

    if (( PSHIV==1 )); then
        drawMessage "Jake" "I've found a shiv in the toilet bucket...man that was rough!" 0 1
    fi
    
    storyPenalColonyProgress5Plasma
    storyPenalColonyProgress5Dialog1Menu
}

function storyPenalColonyProgress5Dialog1Menu()
{
    if (( PSHIV==0 )); then
        MENU=("1:The pipe:0" "2:The bucket:0" "3:The light:0" "4:The panel:0" "5:The blanket:0")
        drawMenu 1 1
        
        while true; do
            read -t 0.01 -s -n 10000 key

            case "$key" in
                [1])
                    storyPenalColonyProgress5Dialog1Sub1Menu
                    ;;
                [2])
                    storyPenalColonyProgress5Dialog1Sub2Menu
                    ;;
                [3])
                    storyPenalColonyProgress5Dialog1Sub3
                    ;;
                [4])
                    storyPenalColonyProgress5Dialog1Sub4
                    ;;
                [5])
                    storyPenalColonyProgress5Dialog1Sub5
                    ;;
                [b])
                    storyPenalColonyProgress5Menu
                    ;;
                [qQ])
                    save
                    quitMenu
                    ;;
            esac
        done
    else
        MENU=("1:The pipe:0" "2:The bucket:0" "3:The light:0" "4:The panel:0" "5:The blanket:0" "6:The shiv:0")
        drawMenu 1 1
        
        while true; do
            read -t 0.01 -s -n 10000 key

            case "$key" in
                [1])
                    storyPenalColonyProgress5Dialog1Sub1Menu
                    ;;
                [2])
                    storyPenalColonyProgress5Dialog1Sub2Menu
                    ;;
                [3])
                    storyPenalColonyProgress5Dialog1Sub3
                    ;;
                [4])
                    storyPenalColonyProgress5Dialog1Sub4
                    ;;
                [5])
                    storyPenalColonyProgress5Dialog1Sub5
                    ;;
                [6])
                    storyPenalColonyProgress5Dialog1Sub6
                    ;;
                [b])
                    storyPenalColonyProgress5Menu
                    ;;
                [qQ])
                    save
                    quitMenu
                    ;;
            esac
        done
    fi
}

function storyPenalColonyProgress5Dialog1Sub1Menu()
{
    if (( PSHIV==0 )); then
        MENU=("1:Inspect the pipe:0" "2:Touch the pipe:0" "3:Kick the pipe:0")
        drawMenu 1 1

        while true; do
            read -t 0.01 -s -n 10000 key

            case "$key" in
                [1])
                    storyPenalColonyProgress5Dialog1Sub11
                    ;;
                [2])
                    storyPenalColonyProgress5Dialog1Sub12
                    ;;
                [3])
                    storyPenalColonyProgress5Dialog1Sub13
                    ;;
                [b])
                    storyPenalColonyProgress5Dialog1Menu
                    ;;
                [qQ])
                    save
                    quitMenu
                    ;;
            esac
        done
    else
        MENU=("1:Inspect the pipe:0" "2:Touch the pipe:0" "3:Kick the pipe:0" "4:Stab the pipe:0")
        drawMenu 1 1

        while true; do
            read -t 0.01 -s -n 10000 key

            case "$key" in
                [1])
                    storyPenalColonyProgress5Dialog1Sub11
                    ;;
                [2])
                    storyPenalColonyProgress5Dialog1Sub12
                    ;;
                [3])
                    storyPenalColonyProgress5Dialog1Sub13
                    ;;
                [4])
                    storyPenalColonyProgress5Dialog1Sub14
                    ;;
                [b])
                    storyPenalColonyProgress5Dialog1Menu
                    ;;
                [qQ])
                    save
                    quitMenu
                    ;;
            esac
        done
    fi
}

function storyPenalColonyProgress5Dialog1Sub11()
{
    menuItem $((MENU_START_Y+1)) "1" "Inspect the pipe" 1

    drawMessage "Jake" "It's got to be a plasma flow pipe." 0 1
    drawMessage "Jake" "That explains why it's so hot in here." 0 1

    if (( PHPIPE==1 )); then
        drawMessage "Jake" "I've managed to dent the pipe weakening the metal at one point." 0 1
    fi

    menuItem $((MENU_START_Y+1)) "1" "Inspect the pipe"
    storyPenalColonyProgress5Plasma
}

function storyPenalColonyProgress5Dialog1Sub12()
{
    menuItem $((MENU_START_Y+2)) "2" "Touch the pipe" 1

    drawMessage "Jake" "*OUCH* Jesus that's hot!"
    drawMessage "Jake" "That'll leave a mark for a few weeks!"

    menuItem $((MENU_START_Y+2)) "2" "Touch the pipe"
    storyPenalColonyProgress5Plasma
}

function storyPenalColonyProgress5Dialog1Sub13()
{
    menuItem $((MENU_START_Y+3)) "3" "Kick the pipe" 1

    if (( PHPIPE==0 )); then
        drawMessage "Jake" "*BAM* *BAM* Well that did a lot of good..."
        drawMessage "Jake" "Wait! I've dented the pipe a little."
        drawMessage "Jake" "A couple more kicks and I'll weaken it just enough. *BAM* *BAM*"
    else
        drawMessage "Jake" "I've already weakened the pipe at one point." 0 1
    fi
    PHPIPE=1
    menuItem $((MENU_START_Y+3)) "3" "Kick the pipe"
    storyPenalColonyProgress5Plasma
}

function storyPenalColonyProgress5Dialog1Sub14()
{
    menuItem $((MENU_START_Y+4)) "4" "Stab the pipe" 1

    if (( PHPIPE==0 )); then
        drawMessage "Jake" "*STAB* *STAB* I'm getting no where with this!"
        drawMessage "Jake" "I need to weaken the pipe first so I can target a weak point."
    else
        drawMessage "Jake" "*STAB* *STAB* OH CRAP!"
        drawMessage "Jake" "Plasma is leaking everywhere!"
        drawMessage "Jake" "Any spark would cause an explosion in a heartbeat." 0 1
        PHPLASMA=1
    fi
    PHPIPE=1
    menuItem $((MENU_START_Y+4)) "4" "Stab the pipe"
    storyPenalColonyProgress5Plasma
}

function storyPenalColonyProgress5Dialog1Sub2Menu()
{
    MENU=("1:Inspect the bucket:0" "2:Dig through the contents:0")
    drawMenu 1 1
    
    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[1])
				storyPenalColonyProgress5Dialog1Sub21
				;;
            [2])
				storyPenalColonyProgress5Dialog1Sub22
				;;
            [b])
				storyPenalColonyProgress5Dialog1Menu
				;;
			[qQ])
				save
				quitMenu
				;;
        esac
    done
}

function storyPenalColonyProgress5Dialog1Sub21()
{
    menuItem $((MENU_START_Y+1)) "1" "Inspect the bucket" 1

    drawMessage "Jake" "Clearly the toilet and they don't clean it out that often as it's full of sh..." 0 1
    drawMessage "Jake" "Aww man, the smell...I'm going to throw up!" 0 1

    menuItem $((MENU_START_Y+1)) "1" "Inspect the bucket"
    storyPenalColonyProgress5Plasma
}

function storyPenalColonyProgress5Dialog1Sub22()
{
    menuItem $((MENU_START_Y+2)) "2" "Dig through the contents" 1

    if (( PSHIV==0 )); then
        drawMessage "Jake" "OK..here we go!"
        drawMessage "Jake" "Uurrgghhh....I'm gonna throw up!"
        drawMessage "Jake" "Don't think about it Jake!" 0 1
        drawMessage "Jake" "Wait, what's this?!"
        drawMessage "Jake" "A SHIV!"
        drawMessage "Jake" "This will come in handy!"
    else
        drawMessage "Jake" "I'm not digging through that again!" 0 1
        drawMessage "Jake" "I've got the shiv, that's enough crap for me!" 0 1
    fi

    PSHIV=1

    menuItem $((MENU_START_Y+2)) "2" "Dig through the contents"
    storyPenalColonyProgress5Plasma
}

function storyPenalColonyProgress5Dialog1Sub3()
{
    menuItem $((MENU_START_Y+3)) "3" "Inspect the light" 1

    drawMessage "Jake" "The light spans the full length of the room." 0 1
    drawMessage "Jake" "It's very bright and I suspect they don't turn it off at night, whenever that is!" 0 1
    drawMessage "Jake" "I can hear a loud humming sound so it's clearly high voltage." 0 1

    MENU=("1:Try to remove the cover:0")
    drawMenu 1 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[1])
				storyPenalColonyProgress5Dialog1Sub31
				;;
            [b])
				storyPenalColonyProgress5Dialog1Menu
				;;
			[qQ])
				save
				quitMenu
				;;
        esac
    done
}

function storyPenalColonyProgress5Dialog1Sub31()
{
    menuItem $((MENU_START_Y+1)) "1" "Try to remove the cover" 1

    drawMessage "Jake" "If I had something flat and sharp, I could probably work loose the cover." 0 1
    drawMessage "Jake" "Where am I going to find something like that? A shive perhaps?" 0 1

    storyPenalColonyProgress5Plasma
    storyPenalColonyProgress5Dialog1Sub3
}

function storyPenalColonyProgress5Dialog1Sub4()
{
    menuItem $((MENU_START_Y+4)) "4" "Inspect the panel" 1

    drawMessage "Jake" "There's a sheet of metal covering something with four bolts in each corner." 0 1
    drawMessage "Jake" "One of the bolts looks a little loose." 0 1
    drawMessage "Jake" "If I had something to pry at it I think I could get it out." 0 1

    MENU=("1:Pull on the panel:0")
    drawMenu 1 1    

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[1])
				storyPenalColonyProgress5Dialog1Sub1
				;;
            [b])
				storyPenalColonyProgress5Dialog1Menu
				;;
			[qQ])
				save
				quitMenu
				;;
        esac
    done
}

function storyPenalColonyProgress5Dialog1Sub5()
{
    menuItem $((MENU_START_Y+5)) "5" "Inspect the blanket" 1

    drawMessage "Jake" "This blanket is rough..." 0 1
    drawMessage "Jake" "I'm guessing it's coated in fire retardant so prisoners can't mess around." 0 1
    drawMessage "Jake" "It's extermely tough too." 0 1
    drawMessage "Jake" "You'd never be able to rip this into pieces. Not even with a knife!" 0 1
    
    if (( PSHIV==0 )); then
        MENU=("b:Back:0")
        drawMenu 1 0

        while true; do
            read -t 0.01 -s -n 10000 key

            case "$key" in
                [b])
                    storyPenalColonyProgress5Dialog1Menu
                    ;;
                [qQ])
                    save
                    quitMenu
                    ;;
            esac
        done
    else
        MENU=("1:Cut the blanket with shiv:0")
        drawMenu 1 1

        while true; do
            read -t 0.01 -s -n 10000 key

            case "$key" in
                [1])
                    storyPenalColonyProgress5Dialog1Sub5Cut
                    ;;
                [b])
                    storyPenalColonyProgress5Dialog1Menu
                    ;;
                [qQ])
                    save
                    quitMenu
                    ;;
            esac
        done
    fi
}

function storyPenalColonyProgress5Dialog1Sub5()
{
    drawMessage "Jake" "*SNAP* Nice going Jake!" 0
    drawMessage "Jake" "I've snapped the shiv and its totally useless now!" 0

    gameover "Jake ended serving his 30 days and then Taki got a hold of him..."
}

function storyPenalColonyProgress5Dialog2()
{
    menuItem $((MENU_START_Y+1)) "2" "Call out to the guard" 1

    drawMessage "Jake" "Guard...Guard..."
    drawMessage "Jake" "No answer, they are clearly out of ear shot or asleep." 1 1
    drawMessage "Jake" "Perhaps the room is completely sound proof?" 1 1

    storyPenalColonyProgress5Plasma
    storyPenalColonyProgress5Menu
}

function storyPenalColonyProgress5Dialog3()
{
    menuItem $((MENU_START_Y+2)) "3" "Talk to prisoner next door" 1

    drawMessage "Jake" "Hey...Hey, you next door..."
    drawMessage "Jake" "No answer, either there is no one next door..." 0 1
    drawMessage "Jake" "Or they can't hear me through the door and walls." 0 1

    storyPenalColonyProgress5Plasma
    storyPenalColonyProgress5Menu
}

function storyPenalColonyProgress5Dialog1Sub6()
{
    menuItem $((MENU_START_Y+6)) "6" "Inspect the shiv" 1

    drawMessage "Jake" "A simple homemade shiv..." 0 1
    drawMessage "Jake" "Looks like someone took a fan blade and sharpened it." 0 1
    drawMessage "Jake" "It's no match for a phaser but it's sharp." 0 1

    storyPenalColonyProgress5Plasma
    storyPenalColonyProgress5Dialog1Menu
}