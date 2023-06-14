# !/bin/bash
source $UNIVERSE_PATH/federation/story/outpost3366/misc.sh

#storyOutpost3366Progress4
function storyOutpost3366Progress4()
{
    updateShields 70

    AT_LOCATION="shipOmegaDoomExteria"
    drawScreen
    SCREEN_REDRAW=0

    MENU=("c:Communications:0" "n:Navigation:0" "s:Sensors:0" "w:Weapons:0" "e:Engineering:0")
    drawMenu 1 0

    drawMessage "Abrahams" "Mr Simons, target that ship and fire at will!"

    menuItem $((MENU_START_Y+3)) "w" "Weapons" 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[cC])
				storyOutpost3366Progress4CommsMenu
				;;
			[eE])
				storyOutpost3366Progress4EngineMenu
				;;
			[nN])                
				storyOutpost3366Progress4NavigationMenu
				;;
			[qQ])
				save
				quitMenu
				;;
			[sS])
				storyOutpost3366Progress4SensorsMenu
				;;
			[wW])
				storyOutpost3366Progress4WeaponsMenu		
				;;
        esac
    done
}

function storyOutpost3366Progress4CommsMenu()
{
    MENU=("1:Hail the Outpost:0" "2:Hail the Omega Doom:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress4
                ;;
			[1])
				storyOutpost3366Progress4CommsStatus
                break
				;;
            [2])
				storyOutpost3366Progress4CommsHailOmega
                break
				;;
        esac
    done
}

function storyOutpost3366Progress4CommsStatus()
{
    storyOutpost3366CommsStatus
    storyOutpost3366Progress4CommsMenu
}

function storyOutpost3366Progress4CommsHailOmega()
{
    storyOutpost3366CommsOmegaStatus
    storyOutpost3366Progress4CommsMenu
}

function storyOutpost3366Progress4EngineMenu()
{
    MENU=("1:Status Report:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress4
                ;;
			[1])
				storyOutpost3366Progress4EngStatus
                break
				;;
        esac
    done
}

function storyOutpost3366Progress4EngStatus()
{
    menuItem $((MENU_START_Y+4)) "e" "Engineering" 0

    drawMessage "Abrahams" "Cheif, what the status?"

    drawMessage "Peters" "Captain, engines are offline. We've took major damage to the core."
    drawMessage "Peters" "Shields are failing and life support isn't fairing much better!"

    drawMessage "Abrahams" "Lifepods?"
    
    drawMessage "Peters" "Out of action."

    drawMessage "Abrahams" "Weapons?!"

    drawMessage "Peters" "Aye sir, I've rerouted what's left of impluse power to the weapons."

    storyOutpost3366Progress4
}

function storyOutpost3366Progress4NavigationMenu()
{
    MENU=("1:Status Report:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress4
                ;;
			[1])
				storyOutpost3366Progress4NavigationStatus
                break
				;;
        esac
    done
}

function storyOutpost3366Progress4NavigationStatus()
{
    storyOutpost3366NavigationDead
    storyOutpost3366Progress4
}

function storyOutpost3366Progress4SensorsMenu()
{
    MENU=("1:Scan the Outpost 3366:0" "2:Scan the Region:0" "3:Scan the Omega Doom:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress4
                ;;
			[1])
				storyOutpost3366Progress4ScanOutpost
                break
				;;
			[2])
				storyOutpost3366Progress4ScanRegion
                break
				;;
            [3])
				storyOutpost3366Progress4ScanOmega
                break
				;;
        esac
    done
}

function storyOutpost3366Progress4ScanOmega()
{
    menuItem $((MENU_START_Y+3)) "3" "Scan the Omega Doom" 1

    drawMessage "Thomas" "Scanning the ship."
    drawMessage "Thomas" "I'm unable to penetrate the shields Captain...but.."
    drawMessage "Thomas" "Yes, I think targeting her sensors array we might be able to damage it."
    drawMessage "Thomas" "Mr Simons, target the ship's sensors."

    storyOutpost3366Progress4SensorsMenu
}

function storyOutpost3366Progress4ScanOutpost()
{
    storyOutpost3366ScanOutpost
    storyOutpost3366Progress4SensorsMenu
}

function storyOutpost3366Progress4ScanRegion()
{
    storyOutpost3366ScanRegion
    storyOutpost3366Progress4SensorsMenu
}

function storyOutpost3366Progress4WeaponsMenu()
{
    MENU=("1:Target the Omega Doom:0" "2:Target the Outpost:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress4
                ;;
			[1])
				storyOutpost3366Progress4OmegaTargeting
                break
				;;
            [2])
				storyOutpost3366Progress4OutpostTargeting
				;;
        esac
    done
}
# End storyOutpost3366Progress4

# Omega Weapons
function storyOutpost3366Progress4OmegaTargeting()
{
    MENU=("1:Target the Engines:0" "2:Target the Shields:0" "3:Target the Sensors:0" "4:Target the Weapons:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress4WeaponsMenu
                ;;
			[1])
				storyOutpost3366Progress4FireEngines
				;;
            [2])
				storyOutpost3366Progress4FireShields
				;;
            [3])
				storyOutpost3366Progress4FireSensors
				;;
            [4])
				storyOutpost3366Progress4FireWeapons
				;;
        esac
    done
}

function storyOutpost3366Progress4FireEngines()
{
    menuItem $((MENU_START_Y+1)) "1" "Target the Engines" 1

    if (( OMEGA_ENGINES == 0 )); then
        drawMessage "Simons" "Their engines are already offline."
    else
        drawMessage "Simons" "Targeting the engines...FIRING!"

        # TODO Liberty firing effect.

        drawMessage "Simons" "Captain, their engines are offline."
        drawMessage "Abrahams" "Good job Mr Simons, now keep firing!"

        OMEGA_ENGINES=0
    fi

    storyOutpost3366Progress4OmegaTargeting
}

function storyOutpost3366Progress4FireSensors()
{
    menuItem $((MENU_START_Y+3)) "3" "Target the Sensors" 1
    
    drawMessage "Simons" "Targeting the sensors...FIRING!"

    # TODO Liberty firing effect.

    if (( OMEGA_SENSORS == 0 )); then
        drawMessage "Simons" "Their sensors are already down."
    else
        drawMessage "Simons" "Direct hit!"

        drawMessage "Simons" "She's as blind as a bat."
        
        drawMessage "Abrahams" "Good work Mr Simons, keep firing!"
        OMEGA_SENSORS=0
    fi

    storyOutpost3366Progress4OmegaTargeting
}

function storyOutpost3366Progress4FireShields()
{
    menuItem $((MENU_START_Y+2)) "2" "Target the Shields" 1

    drawMessage "Simons" "Targeting the shields...FIRING!"

    # TODO Liberty firing effect.

    drawMessage "Simons" "Captain, their shields are holding."

    menuItem $((MENU_START_Y+2)) "2" "Target the Shields" 0
    storyOutpost3366Progress4OmegaFiring
}

function storyOutpost3366Progress4OmegaFiring()
{
    drawMessage "Thomas" "She's charging again...incoming..."

    clearView
    shipOmegaDoomExteriaBlinkFireCharging
    shipOmegaDoomExteriaBlinkFire

    updateShields 20
    drawMessage "Simons" "Captain, the shields are gone, we are a sitting duck!"

    drawMessage "Abrahams" "Damn it! Now what?!"
    drawMessage "Abrahams" "Mr Simons, target that ship and fire at will!"
}

function storyOutpost3366Progress4FireWeapons()
{
    menuItem $((MENU_START_Y+4)) "4" "Target the Weapons" 1

    drawMessage "Simons" "Targeting the weapons...FIRING!"

    # TODO Liberty firing effect.

    drawMessage "Simons" "Captain, minimal damage to weapons."

    menuItem $((MENU_START_Y+4)) "4" "Target the Weapons" 0
    storyOutpost3366Progress4OmegaFiring
}
# End Omega Weapons

# Outpost Weapons
function storyOutpost3366Progress4OutpostTargeting()
{
    MENU=("1:Target the Engines:0" "2:Target the Shields:0" "3:Target the Sensors:0" "4:Target the Weapons:0" "5:Target the Warp Core:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress4WeaponsMenu
                ;;
			[1])
				storyOutpost3366Progress4FireOutpostEngines
				;;
            [2])
				storyOutpost3366Progress4FireOutpostShields
				;;
            [3])
				storyOutpost3366Progress4FireOutpostSensors
				;;
            [4])
				storyOutpost3366Progress4FireOutpostWeapons
				;;
            [5])
				storyOutpost3366Progress4FireOutpostWarpCore
				;;
        esac
    done
}

function storyOutpost3366Progress4FireOutpostEngines()
{
    menuItem $((MENU_START_Y+1)) "1" "Target the Engines" 1
    drawMessage "Simons" "Targeting the engines...FIRING!"
    storyOutpost3366Progress4FireOutpostDead
}

function storyOutpost3366Progress4FireOutpostDead()
{
    SCREEN_REDRAW=0
    # TODO Liberty firing effect.

    drawMessage "Abrahams" "What the hell are you doing Simons?!"
    drawMessage "Abrahams" "I said target the SHIP!"

    drawMessage "Thomas" "She's charging again...incoming..."
    
    clearView
    shipOmegaDoomExteriaBlinkFireCharging
    shipOmegaDoomExteriaBlinkFire

    gameover "The SS Liberty was completely destroyed!"
}

function storyOutpost3366Progress4FireOutpostSensors()
{
    menuItem $((MENU_START_Y+3)) "3" "Target the Sensors" 1
    drawMessage "Simons" "Targeting the sensors...FIRING!"
    storyOutpost3366Progress4FireOutpostDead
}

function storyOutpost3366Progress4FireOutpostShields()
{
    menuItem $((MENU_START_Y+2)) "2" "Target the Shields" 1
    drawMessage "Simons" "Targeting the shields...FIRING!"
    storyOutpost3366Progress4FireOutpostDead
}

function storyOutpost3366Progress4FireOutpostWarpCore()
{
    menuItem $((MENU_START_Y+5)) "5" "Target the Warp Core" 1
    drawMessage "Simons" "Targeting the outposts warp core...FIRING!"
    
    drawMessage "Simons" "Direct hit!"

    drawMessage "Thomas" "The warp core is going critical Captain!"
    
    STORY_PROGRESS_FILE=$UNIVERSE_PATH/federation/story/outpost3366/progress4
    STORY_PROGRESS="storyOutpost3366Progress4Explosion"
    SCREEN_REDRAW=1
    storyOutpost3366Progress4Explosion 1
}

function storyOutpost3366Progress4FireOutpostWeapons()
{
    menuItem $((MENU_START_Y+4)) "4" "Target the Weapons" 1
    drawMessage "Simons" "Targeting the weapons...FIRING!"
    storyOutpost3366Progress4FireOutpostDead
}
# End Outpost Weapons

# storyOutpost3366Progress4Explosion
function storyOutpost3366Progress4Explosion()
{
    FEDERATION_OUTPOST=0

    tput clear
    federationOutPost3366Explosion
    
    AT_LOCATION="atFederationOutPost3366Shockwave"
    drawScreen
    SCREEN_REDRAW=0    

    MENU=("c:Communications:0" "n:Navigation:0" "s:Sensors:0" "w:Weapons:0" "e:Engineering:0")
    drawMenu 1 0

    drawMessage "Thomas" "Incoming shockwave..."

    if (( OMEGA_ENGINES==1 )); then
        drawMessage "Simons" "Captain, the Omega Doom just vanished from view."
    else
        drawMessage "Simons" "Captain, the Omega Doom is in direct path of the shockwave..."
        drawMessage "Simons" "Her engines are offline, she isn't going anywhere!"
    fi

    drawMessage "Abrahams" "Helm, turn us away from that shockwave!"
    
    menuItem $((MENU_START_Y+1)) "n" "Navigation" 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[cC])
				storyOutpost3366Progress4ExplosionLock
				;;
			[eE])
				storyOutpost3366Progress4ExplosionLock			
				;;
			[nN])                
				storyOutpost3366Progress4NavigationExplosionMenu
				;;
			[qQ])
				save
				quitMenu
				;;
			[sS])
				storyOutpost3366Progress4ExplosionLock
				;;
			[wW])
				storyOutpost3366Progress4ExplosionLock		
				;;
        esac
    done
}

function storyOutpost3366Progress4NavigationExplosionMenu()
{
    MENU=("1:Turn to Face Port:0" "2:Turn to Face Starboard:0")
    drawMenu 0 1

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
            [bB])
                storyOutpost3366Progress4Explosion
                ;;
			[1])
				storyOutpost3366Progress4Port
                break
				;;
            [2])
				storyOutpost3366Progress4Starboard
				;;
        esac
    done
}

function storyOutpost3366Progress4Port()
{
    drawMessage "Cyrus" "Aye sir, turning port to face the shockwave"
    drawMessage "Abrahams" "Hall hands, brace for IMPACT!"

    SCREEN_REDRAW=0
    # TODO Shockwave destorying Liberty

    gameover "The SS Liberty was completely destroyed!"
}

function storyOutpost3366Progress4Starboard()
{
    drawMessage "Cyrus" "Aye sir, turning starboard to face the shockwave"
    drawMessage "Abrahams" "Hall hands, brace for IMPACT!"

    # TODO Shockwave hitting Liberty

    if (( SHIELDS<=50 )); then
        gameover "The SS Liberty was completely destroyed!"
    else
        updateShields 50

        if (( OMEGA_ENGINES==1 )); then
            drawMessage "Simons" "Captain, the Omega Doom just reappeared."
        else
            # TODO Shockwave hitting Omega Doom
            OMEGA_WEAPONS=0

            drawMessage "Simons" "Captain, the Omega Doom took a direct hit from the shockwave..."
            drawMessage "Simons" "Her weapons are completely down!"

            drawMessage "Abrahams" "Their shields?"

            drawMessage "Simons" "Still holding enough for our weapons."
            drawMessage "Abrahams" "Good work helm, and good job Mr Simons!"
        fi
    fi

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/federation/story/outpost3366/progress4
    STORY_PROGRESS="storyOutpost3366Progress4End"
    storyOutpost3366Progress4End 1
}

function storyOutpost3366Progress4ExplosionLock()
{
    drawMessage "Abrahams" "We need to deal with this incoming shockwave!"
}
# End storyOutpost3366Progress4Explosion

function storyOutpost3366Progress4End()
{
    FEDERATION_OUTPOST=0
    AT_LOCATION="shipOmegaDoomExteria"

    updateShields 50
    if [ -z ${1+x} ]; then
        SCREEN_REDRAW=1
        drawScreen
    else
        clearView
        drawLocation
		drawLocationTitle
    fi   

    SCREEN_REDRAW=0

    MENU=("c:Communications:0" "n:Navigation:0" "s:Sensors:0" "w:Weapons:0" "e:Engineering:0")
    drawMenu 0 0

    drawMessage "Abrahams" "Start sending out destress calls to anyone and everyone..."

    drawMessage "Ambrose" "Already on it Captain but we aren't getting any responses."

    drawMessage "Abrahams" "Don't tell me the comms are down too?!"

    drawMessage "Ambrose" "Negative Captain, it's like they aren't answering."

    drawMessage "Abrahams" "Hmmm, comms blackout..."

    drawMessage "Ambrose" "Captain?"

    storyOutpost3366Progress4ProbeDownload

    drawMessage "Abrahams" "Open a channel to the penal colony Solara in the Garis Republic..."
    drawMessage "Abrahams" "Inmate 405298."

    drawMessage "Ambrose" "Channel open."

    drawMessage "Thomas" "John, I'm detecting a massive build up of neutronic radiation again."

    clearView
    shipOmegaDoomExteriaBlinkFireCharging

    drawMessage "Abrahams" "Jake, I know I wasn't much of a father to you."
    drawMessage "Abrahams" "And we've had our problems over the years."

    if (( OMEGA_SENSORS==0 )) && (( OMEGA_WEAPONS==0 )); then
        storyOutpost3366Progress4ProbeLaunch
    else
        storyOutpost3366Progress4ProbeLaunchDestoryed
    fi

    drawMessage "Simons" "Captain, we are having little effect doing any more damage to the Omega Doom..."
    drawMessage "Simons" "Our constant firing has given the Omega Doom a lock!"

    drawMessage "Thomas" "All hands brace for impact!"
    
    clearView
    shipOmegaDoomExteriaBlinkFire

    updateShields 0
    drawMessage "Simons" "Shields down! Weapons are gone..."
    drawMessage "Cyrus" "I've lost all control of the ship..."
    drawMessage "Ambrose" "Comms are down..."
    drawMessage "Thomas" "Captain...the ship...she's took major damage....we need to..."

    drawMessage "Abrahams" "Jake I just want you to know that I lo *EXPLOSION*"

    # TODO Liberty exploding.

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/garis-republic/story/penal_colony/progress1
    STORY_PROGRESS="storyPenalColonyProgress1"
    SCREEN_REDRAW=1
    progressStory
}

function storyOutpost3366Progress4ProbeDownload()
{
    drawMessage "Abrahams" "Number one, download all the data collected from the outpost to a subspace probe."
    drawMessage "Abrahams" "Launch it when ready."

    drawMessage "Thomas" "Captain, the sensors and navigation computers are completely offline..."
    drawMessage "Thomas" "...I'll not be able to launch the probe to anywhere 100 percent certain."

    drawMessage "Abrahams" "Just use your best judgement Thomas."

    drawMessage "Thomas" "Understood."
}

function storyOutpost3366Progress4ProbeLaunch()
{
    # TODO probe launching

    drawMessage "Thomas" "Probe away."
    drawMessage "Abrahams" "Good work Mr Thomas!"
}

function storyOutpost3366Progress4ProbeLaunchDestoryed()
{
    storyOutpost3366Progress4ProbeLaunch

    # TODO probe destroyed

    drawMessage "Thomas" "Captain, the Omega Doom shot the probe down instantly!"
    drawMessage "Abrahams" "Damn it!"
}