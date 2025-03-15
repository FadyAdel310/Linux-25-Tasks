#!/bin/bash

function counterHandle
{   
    localNumber=$1    
    while [[ $localNumber -gt 0 ]]
    do
        echo $localNumber
        ((localNumber--))
        sleep 1
    done
    echo "Time's up!"
}

echo "please, Enter Starting Number :"
read num
counterHandle $num