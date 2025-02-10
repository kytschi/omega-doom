# !/bin/bash
source $UNIVERSE_PATH/federation/story/outpost3366/misc.sh

function storyOutpost3366Progress2()
{
    MENU_BACK=""
    AT_LOCATION="atFederationOutPost3366"
    drawScreen
    SCREEN_REDRAW=0

    MENU=("c:Communications:0" "n:Navigation:0" "s:Sensors:0" "w:Weapons:0" "e:Engineering:0")
    drawMenu 1 0

    drawMessage "Abrahams" "Ambrose, contact Federation Command, put me through to Admiral Byrd."

    menuItem $MENU_START_Y "c" "Communications" 0 1
    
    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[cC])
				storyOutpost3366Progress2SubMenu
				;;
			[eE])
				storyOutpost3366Progress2EngineMenu			
				;;
			[nN])                
				storyOutpost3366Progress2NavigationMenu
				;;
			[qQ])
				save
				quitMenu
				;;
			[sS])
				storyOutpost3366Progress2SensorsMenu
				;;
			[wW])
				storyOutpost3366Progress2WeaponsMenu			
				;;
        esac
    done
}

function storyOutpost3366Progress2NavigationMenu()
{
    MENU=("1:Status Report:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress2
                ;;
			[1])
				storyOutpost3366Progress2NavigationStatus
                break
				;;
        esac
    done
}

function storyOutpost3366Progress2NavigationStatus()
{
    storyOutpost3366NavigationStatus
    storyOutpost3366Progress2
}

function storyOutpost3366Progress2EngineMenu()
{
    MENU=("1:Status Report:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress2
                ;;
			[1])
				storyOutpost3366Progress2EngStatus
                break
				;;
        esac
    done
}

function storyOutpost3366Progress2EngStatus()
{
    storyOutpost3366EngStatus
    storyOutpost3366Progress2
}

function storyOutpost3366Progress2SubMenu()
{
    MENU=("1:Hail Federation Command:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[bB])
				storyOutpost3366Progress2
				;;
			[1])
				storyOutpost3366Progress2Hail			
				;;
        esac
    done
}

function storyOutpost3366Progress2Hail()
{
    menuItem $((MENU_START_Y+1)) "1" "Hail Federation Command" 1

    drawMessage "Ambrose" "Aye sir. Hailing Admiral Bryd at Federation Command."
    pauseMessage

    drawMessage "Ambrose" "Captain, I have Admiral Byrd standing by."
    pauseMessage
    
    drawMessage "Abrahams" "Onscreen."
    pauseMessage

    drawMessage "Ambrose" "Aye sir. Onscreen."
    pauseMessage

    drawMessage "Abrahams" "Admiral, no life signs at the outpost..."
    pauseMessage

    drawMessage "Abrahams" "...we are downloading what we can from their computers..."
    pauseMessage

    drawMessage "Byrd" "I said report back and not to do anything else!"
    pauseMessage

    drawMessage "Byrd" "Damn it John!"
    pauseMessage

    drawMessage "Simons" "Captain! The sensor anomaly, it's moving closer."
    pauseMessage

    drawMessage "Byrd" "What sensor anomaly?!"
    pauseMessage

    drawMessage "Abrahams" "We've picked up some anomaly on our sensors..."
    pauseMessage

    drawMessage "Abrahams" "...Mr Thomas if you please."
    pauseMessage

    drawMessage "Thomas" "Admiral, sensors indicate a solid mass but only for a fraction of a second."
    pauseMessage

    drawMessage "Thomas" "I am also picking up neutronic radiation."
    pauseMessage

    drawMessage "Thomas" "It's like there's a sigularity near by..."
    pauseMessage

    drawMessage "Byrd" "Damn it John, why'd you have to download that data?"
    pauseMessage

    drawMessage "Abrahams" "Rich? Am I missing something here?"
    pauseMessage

    SCREEN_REDRAW=0

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/federation/story/outpost3366/progress2
    STORY_PROGRESS="storyOutpost3366Progress2OmegaDoom"
    progressStory
    
}

function storyOutpost3366Progress2OmegaDoom()
{
    MENU_BACK=""
    AT_LOCATION="atFederationOutPost3366"
    drawScreen
    SCREEN_REDRAW=0

    MENU=("1:Hail Federation Command:1")
    drawMenu 0 1

    drawMessage "Thomas" "Captain, I'm reading a sigularity forming."
    pauseMessage
    
    drawMessage "Abrahams" "Onscreen Mr Thomas."
    pauseMessage

    tput clear
    LOCATION_TITLE="UNKNOWN"
    MESSAGE_CURRENT_CHAR=""
    shipOmegaDoomExteriaBlinkAppear
    sleep 2
    
    MESSAGE_BOX_UP=0
    drawHUD
    drawMenu 0 1

    drawMessage "Simons" "It just appeared out of nowhere!"
    pauseMessage

    drawMessage "Abrahams" "What the hell kind of ship is that?!"
    pauseMessage

    drawMessage "Thomas" "Unknown Captain."
    pauseMessage

    drawMessage "Thomas" "But its the source of the neutronic radiation."
    pauseMessage

    drawMessage "Byrd" "They call it the Omega Doom..."
    pauseMessage

    drawMessage "Byrd" "...John, I'm sorry. This is out of my control."
    pauseMessage

    LOCATION_TITLE="OMEGA DOOM"
    drawLocationTitle

    drawMessage "Abrahams" "What is it Rich? What is the Omega Doom?"
    pauseMessage

    drawMessage "Byrd" "May God welcome you all. Byrd out."
    pauseMessage

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/federation/story/outpost3366/progress3
    STORY_PROGRESS="storyOutpost3366Progress3"
    progressStory
}

function storyOutpost3366Progress2SensorsMenu()
{
    MENU=("1:Outpost 3366:0" "2:Scan Region:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress2
                ;;
			[1])
				storyOutpost3366Progress2ScanOutpost
                break
				;;
			[2])
				storyOutpost3366Progress2ScanRegion
                break
				;;
        esac
    done
}

function storyOutpost3366Progress2ScanOutpost()
{
    storyOutpost3366ScanOutpost
    storyOutpost3366Progress2SensorsMenu
}

function storyOutpost3366Progress2ScanRegion()
{
    storyOutpost3366ScanRegion
    storyOutpost3366Progress2SensorsMenu
}

function storyOutpost3366Progress2WeaponsMenu()
{
    MENU=("1:Status Report:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress2
                ;;
			[1])
				storyOutpost3366Progress2WeaponsStatus
                break
				;;
        esac
    done
}

function storyOutpost3366Progress2WeaponsStatus()
{
    storyOutpost3366WeaponsStatus
    storyOutpost3366Progress2
}