#!/bin/bash

echo "Welcome snake And Ladder problem"

#Initialize Variable
playerPosition=0

#Get a number of die
dieNumber=$((RANDOM % 6 + 1))
echo "Die Result= $dieNumber"
