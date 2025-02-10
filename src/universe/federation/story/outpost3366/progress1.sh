# !/bin/bash

source $UNIVERSE_PATH/federation/story/outpost3366/misc.sh

STORY_RETURN=""
ABRAHAMS_MESSAGE=""

function storyOutpost3366Progress1()
{   
    MENU_BACK=""
    AT_LOCATION="atFederationOutPost3366"
    drawScreen
    SCREEN_REDRAW=0

	drawMessage "Simons" "Captain, thats a Kazaria Syndicate outpost."

    drawMessage "Abrahams" "What the hell is a Kazarian outpost doing in Federation space on the Rosia border?"
    
    storyOutpost3366Progress1Sub
}

function storyOutpost3366Progress1Sub()
{ 
    MENU=("c:Communications:0" "n:Navigation:0" "s:Sensors:0" "w:Weapons:0" "e:Engineering:0")
    drawMenu 1 0

    drawMessage "Abrahams" "Ambrose, hail the outpost."

    menuItem $MENU_START_Y "c" "Communications" 0 1

    STORY_RETURN="storyOutpost3366Progress1Sub"
    ABRAHAMS_MESSAGE="Ambrose, hail the outpost."
    MENU_BACK="storyOutpost3366Progress1Sub"

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[cC])
				storyOutpost3366Progress1SubMenu
				;;
			[eE])
				storyOutpost3366Progress1EngineMenu			
				;;
			[nN])                
				storyOutpost3366Progress1NavigationMenu
				;;
			[qQ])
				save
				quitMenu
				;;
			[sS])
				storyOutpost3366Progress1SensorsMenu
				;;
			[wW])
				storyOutpost3366Progress1WeaponsMenu			
				;;
        esac
    done
}

function storyOutpost3366Progress1SubMenu()
{
    MENU=("1:Hail the Outpost:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[bB])
				storyOutpost3366Progress1
				;;
			[1])
				storyOutpost3366Progress1Hail			
				;;
        esac
    done
}

function storyOutpost3366Progress1Hail()
{
    menuItem $((MENU_START_Y+1)) "1" "Hail the Outpost" 1
    
    drawMessage "Ambrose" "Outpost 3366, this is the SS Liberty."
    drawMessage "Ambrose" "Outpost 3366, this is the SS Liberty, please respond."
    drawMessage "Ambrose" "Outpost 3366, please respond."
    drawMessage "Ambrose" "Captain, there is no response."

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/federation/story/outpost3366/progress1
    STORY_PROGRESS="storyOutpost3366Progress1Scan"
    progressStory
}

function storyOutpost3366Progress1Scan()
{
    MENU_BACK=""
    AT_LOCATION="atFederationOutPost3366"
    drawScreen
    SCREEN_REDRAW=0

    MENU=("c:Communications:0" "n:Navigation:0" "s:Sensors:0" "w:Weapons:0" "e:Engineering:0")
    drawMenu 1 0

    drawMessage "Abrahams" "Number one, scan the outpost for life signs."

    menuItem $((MENU_START_Y+2)) "s" "Sensors" 0 1

    ABRAHAMS_MESSAGE="Number one, scan the outpost for life signs."
    STORY_RETURN="storyOutpost3366Progress1Scan"
    MENU_BACK="storyOutpost3366Progress1Scan"

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[cC])
				storyOutpost3366Progress1CommsMenu
				;;
			[eE])
				storyOutpost3366Progress1EngineMenu			
				;;
			[nN])                
				storyOutpost3366Progress1NavigationMenu
				;;
			[qQ])
				save
				quitMenu
				;;
			[sS])
				storyOutpost3366Progress1SensorsMenu
                break
				;;
			[wW])
				storyOutpost3366Progress1WeaponsMenu			
				;;
        esac
    done
}

function storyOutpost3366Progress1CommsMenu()
{
    MENU=("1:Status Report:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                eval "$STORY_RETURN"
                ;;
			[1])
				storyOutpost3366Progress1CommsStatus
                break
				;;
        esac
    done
}

function storyOutpost3366Progress1CommsStatus()
{
    storyOutpost3366CommsStatus
    eval "$STORY_RETURN"
}

function storyOutpost3366Progress1EngineMenu()
{
    MENU=("1:Status Report:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                eval "$STORY_RETURN"
                ;;
			[1])
				storyOutpost3366Progress1EngStatus
                break
				;;
        esac
    done
}

function storyOutpost3366Progress1EngStatus()
{
    storyOutpost3366EngStatus
    eval "$STORY_RETURN"
}

function storyOutpost3366Progress1NavigationMenu()
{
    MENU=("1:Status Report:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                eval "$STORY_RETURN"
                ;;
			[1])
				storyOutpost3366Progress1NavigationStatus
                break
				;;
        esac
    done
}

function storyOutpost3366Progress1NavigationStatus()
{
    storyOutpost3366NavigationStatus
    eval "$STORY_RETURN"
}

function storyOutpost3366Progress1SensorsMenu()
{
    MENU=("1:Scan the Outpost 3366:0" "2:Scan the Region:0")
    drawMenu 0 1

    STORY_RETURN="storyOutpost3366Progress1SensorsMenu"

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                eval "$MENU_BACK"
                ;;
			[1])
				storyOutpost3366Progress1ScanOutpost
                break
				;;
			[2])
				storyOutpost3366Progress1ScanRegion
                break
				;;
        esac
    done
}

function storyOutpost3366Progress1ScanOutpost()
{
    storyOutpost3366ScanOutpost

    if [[ $STORY_PROGRESS == "storyOutpost3366Progress1Scan" ]]; then
        storyOutpost3366Progress1ScanedOutpost
    else
        eval "$STORY_RETURN"
    fi
}

function storyOutpost3366Progress1ScanedOutpost()
{
    drawMessage "Thomas" "But I am reading an anomaly on sensors."
    drawMessage "Thomas" "Baring 20 08 74."

    drawMessage "Abrahams" "Mr Simons you seeing anything?"

    drawMessage "Simons" "Negative Captain...wait!"

    drawMessage "Abrahams" "What is it?!"

    drawMessage "Simons" "I'm not sure Captain."
    drawMessage "Simons" "First there was a sensor reading then there wasn't."

    drawMessage "Abrahams" "Cloaked ship?"

    drawMessage "Thomas" "Doubtful."
    drawMessage "Thomas" "Sensors are getting a strong reading but only for a fraction of a second."

    drawMessage "Simons" "Captain! There it is again!"

    drawMessage "Abrahams" "Shields up!"
    drawMessage "Abrahams" "I'm not taking any chances."
    drawMessage "Abrahams" "Mr Thomas, link with the outpost's computer..."
    drawMessage "Abrahams" "...and start downloading whatever you can."
    
    drawMessage "Thomas" "Aye Captain."
    
    SCREEN_REDRAW=0

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/federation/story/outpost3366/progress2
    STORY_PROGRESS="storyOutpost3366Progress2"

    progressStory
}

function storyOutpost3366Progress1ScanRegion()
{
    storyOutpost3366ScanRegion
    drawMessage "Abrahams" $ABRAHAMS_MESSAGE
    eval "$STORY_RETURN"
}

function storyOutpost3366Progress1WeaponsMenu()
{
    MENU=("1:Status Report:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                eval "$STORY_RETURN"
                ;;
			[1])
				storyOutpost3366Progress1WeaponsStatus
                break
				;;
        esac
    done
}

function storyOutpost3366Progress1WeaponsStatus()
{
    storyOutpost3366WeaponsStatus
    eval "$STORY_RETURN"
}