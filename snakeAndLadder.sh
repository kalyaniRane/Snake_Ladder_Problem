#!/bin/bash -x

echo "Welcome snake And Ladder problem"

#Initialize the constant
NO_PLAY=0
LADDER=1
SNAKE=2
START_POSITION=0
WINNING_POSITION=100


#Initialize Variable
playerCurrentPosition=0
dieCounter=0
player=2

#Declare a dictionary
declare -A scoreBoard

#Function to get a random number for dice roll and to check the playing option for players
function checkPlayingOption()
{

	dieNumber=$((RANDOM % 6 + 1))

	case $((RANDOM % 3)) in
			$NO_PLAY)playerCurrentPosition=$playerCurrentPosition
				;;
			$LADDER)playerCurrentPosition=$((playerCurrentPosition + dieNumber))
				;;
			$SNAKE)playerCurrentPosition=$((playerCurrentPosition - dieNumber))
				;;
	esac
	getExactPlayerPosition
}

#Function to check players position and stored the positions of playered in ScoreBoared dictionary
function playGame()
{
	while [ $playerCurrentPosition -ne $WINNING_POSITION ]
	do
			changePlayer

			 scoreBoard[$player]=$playerCurrentPosition
				((dieCounter++))
	done
			echo "Player$player is win after $dieCounter DiesRoll"
}

#Function to check Player correct Position
function getExactPlayerPosition()
{
			if [[ $playerCurrentPosition -lt $START_POSITION ]]
			then
					playerCurrentPosition=$START_POSITION
			elif [[ $playerCurrentPosition -gt $WINNING_POSITION ]]
			then
					playerCurrentPosition=$((playerCurrentPosition - dieNumber))
			fi
}

#Function to switch the player
function changePlayer()
{
	if [[ $player -eq 1 ]]
	then
			player=2
	else
			player=1
	fi
	checkPlayingOption
}

#function call to check players won position
playGame
