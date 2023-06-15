# !/bin/bash

function storyPenalColonyProgress1()
{   
    HIDE_HUD=1
    SHOW_STATS=0

    AT_LOCATION="atGarisRepublicPenalColony"

    tput clear
    animateTitle "6 months later" 1

    SCREEN_REDRAW=1
    drawScreen
    SCREEN_REDRAW=0
    HIDE_HUD=0

	drawMessage "Abrahams" "Jake I just want you to know that I lo *EXPLOSION*" 1
    
    drawMessage "Taki" "Jesus Abrahams, do we have to be listening to that again?!"
    drawMessage "Taki" "How many times must we hear about Omega Doom?"
    drawMessage "Taki" "Oooo, the ghost ship that appears out of thin air...it's a MYTH!"

    drawHUD

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
    storyPenalColonyProgress2
}

function storyPenalColonyProgress1Dialog2()
{
    drawMessage "Jake" "We all can't be as sane as you now can we?"
    storyPenalColonyProgress2
}

function storyPenalColonyProgress2()
{
    drawMessage "Taki" "Well your out of here soon right so you can go on your detective mystery then."
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
    drawMessage "Taki" "Wasn't my fault the cops turned up."
    drawMessage "Jake" "I'm not the one who shot the guard and alerted them, am I?"
    drawMessage "Taki" "He shouldn't have been reaching for that alarm."
    storyPenalColonyProgress3
}

function storyPenalColonyProgress2Dialog2()
{
    drawMessage "Jake" "I was framed!"
    drawMessage "Taki" "Sure...like the rest of us..."
    drawMessage "Jake" "I'm not the one who killed the guard am I?"
    drawMessage "Taki" "He shouldn't have been reaching for that alarm."
    drawMessage "Jake" "I was there to break the safe, nothing else!"
    storyPenalColonyProgress3
}

function storyPenalColonyProgress3()
{
    drawMessage "Jake" "But don't you worry I'll be out of here soon enough!"

    drawMessage "Taki" "Oh yeah, your crews coming back for you to help you escape, right?"
    drawMessage "Taki" "How long we all heard that one! HAHAHAHA!"

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
    drawMessage "Taki" "WHAT DID YOU CALL ME?!"
    storyPenalColonyProgress4
}

function storyPenalColonyProgress3Dialog2()
{
    drawMessage "Jake" "Some of us have friends on the outside."
    drawMessage "Jake" "How many you got again Taki?"

    drawMessage "Taki" "Who needs friends?"
    drawMessage "Taki" "Taki looks after himself and no one else!"

    drawMessage "Jake" "And how's that working out for you?"
    storyPenalColonyProgress4
}

function storyPenalColonyProgress4()
{
    drawMessage "Jake" "My crew sent word the other day in a coded message..."
    drawMessage "Jake" "...they are ready for the breakout." 0 1
    drawMessage "Jake" "I just need to get myself sent to the hole..." 0 1

    drawMessage "GRPCPrisonGuard" "Pipe down you two!"

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

    drawMessage "GRPCPrisonGuard" "Keep it up Abrahams, and its 30 days in the hole."

    drawMessage "Jake" "You bet boss, but you know something boss?"
    drawMessage "Jake" "30 days in there would be better than having to look at this worm brain!"

    drawMessage "Taki" "YOUR DEAD ABRAHAMS!!!"

    drawMessage "GRPCPrisonGuard" "Control, open cell 5820."
    drawMessage "GRPCPrisonGuard" "Back off inmate 405297."
    drawMessage "GRPCPrisonGuard" "On your feet Abrahams, your request is granted."

    drawMessage "Jake" "Many thanks boss."
    drawMessage "Jake" "See you in 100 years Taki."
}

function storyPenalColonyProgress4Dialog2()
{
    drawMessage "Jake" "Why do they call you worm brain anyway?"
    drawMessage "Jake" "Oh yeah you've got a parasite in your head...who is the smarter?"

    drawMessage "Taki" "THAT DOES IT!"

    drawMessage "Jake" "With his superior and worm brain..." 0 1
    drawMessage "Jake" "...this isn't going to end well for me!" 0 1
}

function storyPenalColonyProgress5()
{
    
}