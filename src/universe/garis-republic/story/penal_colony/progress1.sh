# !/bin/bash

function storyPenalColonyProgress1()
{   
    HIDE_HUD=1
    SHOW_STATS=0

    LOCATION_SECTOR=""
    AT_LOCATION="atGarisRepublicPenalColony"

    tput clear
    animateTitle "6 months later" 1

    SCREEN_REDRAW=1
    drawScreen
    SCREEN_REDRAW=0
    HIDE_HUD=0

	drawMessage "Abrahams" "Jake I just want you to know that I..*EXPLOSION*" 1
    pauseMessage
    
    drawMessage "Taki" "Jesus Abrahams, do we have to be listening to that again?!"
    pauseMessage

    drawMessage "Taki" "How many times must we hear about Omega Doom?"
    pauseMessage

    drawMessage "Taki" "Oooo, the ghost ship that appears out of thin air...it's a MYTH!"

    drawHUD
    MESSAGE_BOX_UP=0

    MENU=("1:It's a fact:0" "2:Not all of us are sane:0")
    drawMenu 1 0

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[1])
				storyPenalColonyProgress1Dialog1
				;;
            [2])
				storyPenalColonyProgress1Dialog2
				;;
			[qQ])
				save
				quitMenu
				;;
        esac
    done
}

function storyPenalColonyProgress1Dialog1()
{
    drawMessage "Jake" "All myths start with some sort of truth Taki."
    pauseMessage

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/garis-republic/story/penal_colony/progress1
    STORY_PROGRESS="storyPenalColonyProgress2"
    storyPenalColonyProgress2
}

function storyPenalColonyProgress1Dialog2()
{
    drawMessage "Jake" "We all can't be as sane as you now can we?"
    pauseMessage
    
    STORY_PROGRESS_FILE=$UNIVERSE_PATH/garis-republic/story/penal_colony/progress1
    STORY_PROGRESS="storyPenalColonyProgress2"
    storyPenalColonyProgress2
}

function storyPenalColonyProgress2()
{
    SHOW_STATS=0
    AT_LOCATION="atGarisRepublicPenalColony"
    drawScreen
    SCREEN_REDRAW=0

    drawMessage "Taki" "Well your out of here soon right?"
    pauseMessage

    drawMessage "Taki" "Then you can go on your detective mystery."
    pauseMessage

    drawMessage "Taki" "What you got left again? 100 years...AHAHAHAHA"

    MENU=("1:You were there:0" "2:I was framed!:0")
    drawMenu 1 0

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[1])
				storyPenalColonyProgress2Dialog1
				;;
            [2])
				storyPenalColonyProgress2Dialog2
				;;
			[qQ])
				save
				quitMenu
				;;
        esac
    done
}

function storyPenalColonyProgress2Dialog1()
{
    drawMessage "Jake" "You should know, you were there."
    pauseMessage

    drawMessage "Taki" "Wasn't my fault the cops turned up."
    pauseMessage

    drawMessage "Jake" "I'm not the one who shot the guard and alerted them, am I?"
    pauseMessage

    drawMessage "Taki" "He shouldn't have been reaching for that alarm."
    pauseMessage

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/garis-republic/story/penal_colony/progress1
    STORY_PROGRESS="storyPenalColonyProgress3"
    storyPenalColonyProgress3
}

function storyPenalColonyProgress2Dialog2()
{
    drawMessage "Jake" "I was framed!"
    pauseMessage

    drawMessage "Taki" "Sure...like the rest of us..."
    pauseMessage

    drawMessage "Jake" "I'm not the one who killed the guard am I?"
    pauseMessage

    drawMessage "Taki" "He shouldn't have been reaching for that alarm."
    pauseMessage

    drawMessage "Jake" "I was there to break the safe, nothing else!"
    pauseMessage
    
    STORY_PROGRESS_FILE=$UNIVERSE_PATH/garis-republic/story/penal_colony/progress1
    STORY_PROGRESS="storyPenalColonyProgress3"
    storyPenalColonyProgress3
}

function storyPenalColonyProgress3()
{
    SHOW_STATS=0
    AT_LOCATION="atGarisRepublicPenalColony"
    drawScreen
    SCREEN_REDRAW=0

    drawMessage "Jake" "But don't you worry I'll be out of here soon enough!"
    pauseMessage

    drawMessage "Taki" "Oh yeah!"
    pauseMessage

    drawMessage "Taki" "Your crews coming to help you escape..."
    pauseMessage

    drawMessage "Taki" "How long we all heard that one?! HAHAHAHA!"
    pauseMessage

    MENU=("1:Insult the worm brain:0" "2:I've got friends:0")
    drawMenu 1 0

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[1])
				storyPenalColonyProgress3Dialog1
				;;
            [2])
				storyPenalColonyProgress3Dialog2
				;;
			[qQ])
				save
				quitMenu
				;;
        esac
    done
}

function storyPenalColonyProgress3Dialog1()
{
    drawMessage "Jake" "Not long my worm brained friend, not long..."
    pauseMessage

    drawMessage "Taki" "WHAT DID YOU CALL ME?!"
    pauseMessage

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/garis-republic/story/penal_colony/progress1
    STORY_PROGRESS="storyPenalColonyProgress4"
    storyPenalColonyProgress4
}

function storyPenalColonyProgress3Dialog2()
{
    drawMessage "Jake" "Some of us have friends on the outside."
    pauseMessage

    drawMessage "Jake" "How many you got again Taki?"
    pauseMessage

    drawMessage "Taki" "Who needs friends?"
    pauseMessage

    drawMessage "Taki" "Taki looks after himself and no one else!"
    pauseMessage

    drawMessage "Jake" "And how's that working out for you?"
    pauseMessage

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/garis-republic/story/penal_colony/progress1
    STORY_PROGRESS="storyPenalColonyProgress4"
    storyPenalColonyProgress4
}

function storyPenalColonyProgress4()
{
    SHOW_STATS=0
    AT_LOCATION="atGarisRepublicPenalColony"
    drawScreen
    SCREEN_REDRAW=0

    drawMessage "Jake" "My crew sent word the other day in a coded message..." 0 1
    pauseMessage

    drawMessage "Jake" "...they are ready for the breakout." 0 1
    pauseMessage

    drawMessage "Jake" "I just need to get myself sent to the hole..." 0 1
    pauseMessage

    drawMessage "GRPCPrisonGuard" "Pipe down you two!" 0 0

    MENU=("1:Provoke the guard:0" "2:Insult Taki some more:0")
    drawMenu 1 0

    while true; do
	    read -t 0.01 -s -n 10000 key

		case "$key" in
			[1])
				storyPenalColonyProgress4Dialog1
				;;
            [2])
				storyPenalColonyProgress4Dialog2
				;;
			[qQ])
				save
				quitMenu
				;;
        esac
    done
}

function storyPenalColonyProgress4Dialog1()
{
    drawMessage "Jake" "Sorry boss, we'll keep it down to a low roar."
    pauseMessage

    drawMessage "GRPCPrisonGuard" "Keep it up Abrahams, and its 30 days in the hole."
    pauseMessage

    drawMessage "Jake" "You bet boss, but you know something boss?"
    pauseMessage

    drawMessage "Jake" "30 days in there would be better than having to look at this worm brain!"
    pauseMessage

    drawMessage "Taki" "YOUR DEAD ABRAHAMS!!!"
    pauseMessage

    drawMessage "GRPCPrisonGuard" "Control, open cell 5820."
    pauseMessage

    drawMessage "GRPCPrisonGuard" "Back off inmate 405297."
    pauseMessage

    drawMessage "GRPCPrisonGuard" "On your feet Abrahams, your request is granted."
    pauseMessage

    drawMessage "Jake" "Many thanks boss."
    pauseMessage

    drawMessage "Jake" "See you in 100 years Taki."
    pauseMessage

    STORY_PROGRESS_FILE=$UNIVERSE_PATH/garis-republic/story/penal_colony/progress5
    STORY_PROGRESS="storyPenalColonyProgress5"
    progressStory
}

function storyPenalColonyProgress4Dialog2()
{
    drawMessage "Jake" "Why do they call you worm brain anyway?"
    pauseMessage

    drawMessage "Jake" "Oh yeah you've got a parasite in your head...who is the smarter?"
    pauseMessage

    drawMessage "Taki" "THAT DOES IT!"
    pauseMessage

    drawMessage "Jake" "With his superior strength and worm brain..." 0 1
    pauseMessage

    drawMessage "Jake" "...this isn't going to end well for me!" 0 1
    pauseMessage

    gameover "Jake ended up in the infirmary badly beaten and with no means of escape!"
}