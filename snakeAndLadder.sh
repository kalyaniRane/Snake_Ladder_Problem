#!/bin/bash

echo "Welcome snake And Ladder problem"

#Initialize the constant
NO_PLAY=0
LADDER=1
SNAKE=2

#Initialize Variable
playerPosition=0
dieCounter=0
player=2

#Declare a dictionary
declare -A positionDict

#Function to check the next step of player
function checkNextStep()
{
	#Get a number of die
	dieNumber=$((RANDOM % 6 + 1))

	#Get random number and check the next step for player
	case $((RANDOM % 3)) in
			$NO_PLAY)playerPosition=$playerPosition
				;;
			$LADDER)playerPosition=$((playerPosition + dieNumber))
				;;
			$SNAKE)playerPosition=$((playerPosition - dieNumber))
				;;
	esac
}

#Function to check players position
function repeatTillWin()
{
	while [ $playerPosition -ne 100 ]
	do
			#functions calling
			checkPlayer
			checkNextStep
			checkPlayerPosition

			#store players position at dice counter
			 positionDict[dieCounter]=$playerPosition
				((dieCounter++))
	done
			echo "Player$player is win"
}

#Function to check Player correct Position
function checkPlayerPosition()
{
			if [[ $playerPosition -lt 0 ]]
			then
					playerPosition=0
			elif [[ $playerPosition -gt 100 ]]
			then
					playerPosition=$((playerPosition - dieNumber))
			fi
}

#Function to switch the player
function checkPlayer()
{
	if [[ $player -eq 1 ]]
	then
			player=2
	else
			player=1
	fi
}

#function call to check players won position
repeatTillWin
