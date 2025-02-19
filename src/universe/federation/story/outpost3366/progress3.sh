# !/bin/bash
source $UNIVERSE_PATH/federation/story/outpost3366/misc.sh

function storyOutpost3366Progress3()
{   
    OMEGA_ENGINES=1
    OMEGA_SENSORS=1
    OMEGA_WEAPONS=1

    SCREEN_REDRAW=1

    updateShields 100

    AT_LOCATION="shipOmegaDoomExteria"
    LOCATION_SECTOR="FEDERATION"
    drawScreen
    SCREEN_REDRAW=0

    drawMessage "Abrahams" "RED ALERT!"
    updateTactical "RED ALERT"
    pauseMessage
    
    drawMessage "Thomas" "Captain! I'm reading a massive build up of neutronic radiation."
    pauseMessage

    drawMessage "Thomas" "It's being focused in our direction..."
    pauseMessage

    shipOmegaDoomExteriaBlinkFireCharging

    # SCREEN_REDRAW=1
    # AT_LOCATION="shipOmegaDoomExteriaCharging"
    # LOCATION_SECTOR="FEDERATION"
    # drawScreen
    # SCREEN_REDRAW=0

    MESSAGE_BOX_UP=0
    drawMessage "Abrahams" "ALL HANDS! BRACE FOR IMPACT!" 1
    pauseMessage
    
    shipOmegaDoomExteriaBlinkFire

    drawLocationTitle
    updateShields 40 1
    MESSAGE_BOX_UP=0
    drawHUD

    MENU=("c:Communications:0" "n:Navigation:0" "s:Sensors:0" "w:Weapons:0" "e:Engineering:0")
    drawMenu 1 0

    drawMessage "Abrahams" "Engineering damage report!"
    pauseMessage

    menuItem $((MENU_START_Y+4)) "e" "Engineering" 0 1
    
    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[cC])
				storyOutpost3366Progress3CommsMenu
				;;
			[eE])
				storyOutpost3366Progress3EngineMenu			
				;;
			[nN])                
				storyOutpost3366Progress3NavigationMenu
				;;
			[qQ])
				save
				quitMenu
				;;
			[sS])
				storyOutpost3366Progress3SensorsMenu
				;;
			[wW])
				storyOutpost3366Progress3WeaponsMenu			
				;;
        esac
    done
}

function storyOutpost3366Progress3CommsMenu()
{
    MENU=("1:Hail the Outpost:0" "2:Hail the Omega Doom:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress3
                ;;
			[1])
				storyOutpost3366Progress3CommsStatus
                break
				;;
            [2])
				storyOutpost3366Progress3CommsHailOmega
                break
				;;
        esac
    done
}

function storyOutpost3366Progress3CommsStatus()
{
    storyOutpost3366CommsStatus
    storyOutpost3366Progress3CommsMenu
}

function storyOutpost3366Progress3CommsHailOmega()
{
    storyOutpost3366CommsOmegaStatus
    storyOutpost3366Progress3CommsMenu
}

function storyOutpost3366Progress3DamageReport()
{
    SCREEN_REDRAW=0
    menuItem $((MENU_START_Y+1)) "1" "Status Report" 1

    drawMessage "Abrahams" "Cheif, what the status?"
    pauseMessage

    drawMessage "Peters" "Captain, engines are offline."
    pauseMessage

    drawMessage "Peters" "Whatever that beam was..."
    pauseMessage

    drawMessage "Peters" "...it completely ripped through our shields like butter!"
    pauseMessage

    drawMessage "Peters" "They've completely collapsed the warp field."
    pauseMessage

    drawMessage "Peters" "Shields took a beating but are holding at 40 percent efficiency."
    pauseMessage

    drawMessage "Peters" "There are reports from all over the ship that systems are offline..."
    pauseMessage

    drawMessage "Peters" "...and in some sections they reporting catastrophic structural damages."
    pauseMessage

    drawMessage "Peters" "Most the damage is confined to the port side."
    pauseMessage

    drawMessage "Peters" "I've got all repair crews I can spare attempting to plug the breaches."
    pauseMessage

    drawMessage "Abrahams" "Weapons?!"
    pauseMessage

    drawMessage "Peters" "Aye sir, I've rerouted what's left of impluse power to the weapons and shields."
    pauseMessage

    updateShields 70
    drawMessage "Peters" "That'll boost the shields to about 70 percent efficiency."
    pauseMessage

    drawMessage "Peters" "Captain..."
    pauseMessage

    drawMessage "Abrahams" "Yes Chief?"
    pauseMessage

    drawMessage "Peters" "She'll survive another blast from that ship..."
    pauseMessage

    drawMessage "Peters" "...but that'll be our shields all but gone."
    pauseMessage

    drawMessage "Peters" "That energy is just too powerful for them."
    pauseMessage

    drawMessage "Peters" "It's not like a blast from a warp core shockwave."
    pauseMessage

    drawMessage "Peters" "That she'll take minimal damage from."
    pauseMessage

    drawMessage "Abrahams" "Understood Chief, Abrahams out."
    pauseMessage

    OMEGA_ENGINES=1
    OMEGA_SENSORS=1
    OMEGA_WEAPONS=1

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/federation/story/outpost3366/progress4
    STORY_PROGRESS="storyOutpost3366Progress4"
    progressStory
}

function storyOutpost3366Progress3EngineMenu()
{
    MENU=("1:Status Report:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress3
                ;;
			[1])
				storyOutpost3366Progress3DamageReport
                break
				;;
        esac
    done
}

function storyOutpost3366Progress3NavigationMenu()
{
    MENU=("1:Status Report:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress3
                ;;
			[1])
				storyOutpost3366Progress3NavigationStatus
                break
				;;
        esac
    done
}

function storyOutpost3366Progress3NavigationStatus()
{
    storyOutpost3366NavigationDead
    storyOutpost3366Progress3
}

function storyOutpost3366Progress3SensorsMenu()
{
    MENU=("1:Scan the Outpost 3366:0" "2:Scan the Region:0" "3:Scan the Omega Doom:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress3
                ;;
			[1])
				storyOutpost3366Progress3ScanOutpost
                break
				;;
			[2])
				storyOutpost3366Progress3ScanRegion
                break
				;;
            [3])
				storyOutpost3366Progress3ScanOmega
                break
				;;
        esac
    done
}

function storyOutpost3366Progress3ScanOmega()
{
    storyOutpost3366ScanOmega
    storyOutpost3366Progress3SensorsMenu
}

function storyOutpost3366Progress3ScanOutpost()
{
    storyOutpost3366ScanOutpost
    storyOutpost3366Progress3SensorsMenu
}

function storyOutpost3366Progress3ScanRegion()
{
    storyOutpost3366ScanRegion
    storyOutpost3366Progress3SensorsMenu
}

function storyOutpost3366Progress3WeaponsMenu()
{
    MENU=("1:Status Report:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress3
                ;;
			[1])
				storyOutpost3366Progress3WeaponsStatus
                break
				;;
        esac
    done
}

function storyOutpost3366Progress3WeaponsStatus()
{
    menuItem $((MENU_START_Y+1)) "1" "Status Report" 1

    drawMessage "Abrahams" "Mr Simons, status report."
    pauseMessage

    drawMessage "Simons" "Weapons systems are reporting 100 percent across the board."
    pauseMessage

    drawMessage "Simons" "I have a sensor lock on the ship Captain."
    pauseMessage

    drawMessage "Abrahams" "Acknowledged Mr Simons."
    pauseMessage

    storyOutpost3366Progress3
}