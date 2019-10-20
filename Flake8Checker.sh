#!/bin/bash

# A simple script to make our lives easier while checking Flake8 syntax in .py files.
# Code by: M4RC0Sx
# GitHub: https://github.com/M4RC0Sx/Flake8Checker


DIR=""

if [ $# -ne 1 ]
  then
    echo -ne "\e[1mFlake8Checker - Usage:\e[0m ./Flake8Checker.sh <directory to check>\n"
    exit 1
fi

if [[ $1 == */ ]]
  then
    DIR=${1:0:$(expr ${#var} - 1)}
else
    DIR=$1  
fi

for file in $DIR/*.py; do
    
    if [[ $(flake8 $file | wc -c) -ne 0 ]]; then
        echo -ne "\e[1m-> \e[1;4mChecking $file syntax\e[0m... \e[1m- \033[38;5;9m $(flake8 $file |  wc -l) ERRORS FOUND\n\e[0m"
        flake8 $file
    else
        echo -ne "\e[1m-> \e[1;4mChecking $file syntax\e[0m...\e[0m \e[1m- \033[38;5;10mNO ERRORS FOUND\n\e[0m"
        flake8 $file
    fi
    
    echo

done