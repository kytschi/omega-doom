# !/bin/bash

function storyOutpost3366CommsStatus()
{
    drawMessage "Ambrose" "Captain, there is no response from the outpost."
    drawMessage "Abrahams" "Understood."
}

function storyOutpost3366CommsOmegaStatus()
{
    drawMessage "Ambrose" "Captain, there is no response from the ship."
    drawMessage "Abrahams" "Understood."
}

function storyOutpost3366EngStatus()
{
    menuItem $((MENU_START_Y+1)) "1" "Status Report" 1

    drawMessage "Abrahams" "Chief, status report."

    drawMessage "Peters" "We've detected a fluctuation in the warp core, but nothing too serious."

    drawMessage "Abrahams" "Fluctuation?"

    drawMessage "Peters" "We normally see this when near a blackhole."

    drawMessage "Abrahams" "We are detecting an anomaly. A sigularity to be exact."
    drawMessage "Abrahams" "Mr Thomas reports that he is detecting neutronic radiation."

    drawMessage "Peters" "That'll explain it Captain."
    drawMessage "Peters" "But it's well with in the safety parameters of the core."

    drawMessage "Abrahams" "Acknowledged Cheif, Abrahams out."
}

function storyOutpost3366NavigationStatus()
{
    drawMessage "Cyrus" "Captain, we are at the Outpost 3366 in Federation space..."
    drawMessage "Cyrus" "...on the border with the Rosia Empire."
    drawMessage "Cyrus" "The outpost is to our port side sir."

    drawMessage "Abrahams" "Acknowledged Mr Cyrus."
}

function storyOutpost3366NavigationDead()
{
    drawMessage "Cyrus" "Captain, our engines are offline. She's dead in the water."
    drawMessage "Abrahams" "Damn it!"
}

function storyOutpost3366WeaponsStatus()
{
    menuItem $((MENU_START_Y+1)) "1" "Status Report" 1

    drawMessage "Abrahams" "Mr Simons, status report."

    drawMessage "Simons" "Weapons systems are reporting 100 percent across the board Captain."
    drawMessage "Simons" "Sensor's are picking up the anomaly, but nothing I can get a fix on."

    drawMessage "Abrahams" "Acknowledged Mr Simons."
}

function storyOutpost3366ScanOmega()
{
    menuItem $((MENU_START_Y+3)) "3" "Scan the Omega Doom" 1

    drawMessage "Thomas" "Scanning the ship."
    drawMessage "Thomas" "I'm unable to penetrate the shields Captain...but.."

    drawMessage "Abrahams" "What is it?"

    drawMessage "Thomas" "Interesting."

    drawMessage "Abrahams" "Damn it Thomas, what is it?"

    drawMessage "Thomas" "I'm showing Kazarian energy signals."

    drawMessage "Abrahams" "Kazarian?!"
}

function storyOutpost3366ScanOutpost()
{
    menuItem $((MENU_START_Y+1)) "1" "Scan the Outpost 3366" 1

    drawMessage "Thomas" "Scanning the outpost."
    drawMessage "Thomas" "No life signs Captain."

    drawMessage "Abrahams" "Where are they?"
    drawMessage "Abrahams" "Any signs of damage?"

    drawMessage "Thomas" "Negative."
    drawMessage "Thomas" "I'm showing the stations shields and life support are offline."
    drawMessage "Thomas" "But her warp core seems to be unstable."
}

function storyOutpost3366ScanRegion()
{
    menuItem $((MENU_START_Y+2)) "2" "Scan the Region" 1

    drawMessage "Thomas" "Scanning the region."
    drawMessage "Thomas" "Interesting..."

    drawMessage "Abrahams" "Report number one."

    drawMessage "Thomas" "Sensors are detecting an anomaly but only for a fraction of a second."
    drawMessage "Thomas" "I am also picking up neutronic radiation of the likes I've never seen before in open space..."
    drawMessage "Thomas" "...without a near by sigularity."

    drawMessage "Abrahams" "A sigularity? A blackhole?"

    drawMessage "Thomas" "Affirmative Captain."

    drawMessage "Abrahams" "Are there any known blackholes in this region?"

    drawMessage "Thomas" "Not in this region."

    drawMessage "Abrahams" "Anything further to report Mr Thomas?"

    drawMessage "Thomas" "Negative Captain."
}