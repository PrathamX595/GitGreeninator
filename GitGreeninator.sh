#!/bin/bash

GREEN='\033[0;92m'
RESET='\033[0m'

gitStuff() {
    name=$(git config user.name)
    email=$(git config user.email)

    if [ "$name" == "" ] || [ "$email" == "" ]
    then
        echo "Bruh you didn't even set up you git config"
        sleep 2
        echo "No doubt you need this script....."
        sleep 2
        echo "fine just enter your details"
        sleep 2
        read -p "Enter github username: " n
        read -p "Enter github email: " m

        git config --global user.name "$n"
        git config --global user.email "$m"
    fi
    
    read -p "$(echo -e "Enter the number of Days from which you want your github$GREEN Green$RESET: ")" days

    echo "Doing the hard work...."

    mkdir -p justARepo
    cd justARepo


    git init &> /dev/null
    git branch -m "main"

    for ((i=$days; i>=0; i--))
    do
        echo "test" >> commit.txt
        git add .
        git commit --date "$i day ago" -m "update on secret Project" &> /dev/null 
    done

    github=$(gh repo create secretRepo --private)
    github="${github}.git"

    git remote add origin "$github" &> /dev/null
    git push origin main &> /dev/null

    echo -e "work done chief your github is$GREEN green$RESET"
}

if [ -f /usr/bin/gh ]
then
    gitStuff
else
    (type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
    && sudo mkdir -p -m 755 /etc/apt/keyrings \
    && out=$(mktemp) && wget -nv -O$out https://cli.github.com/packages/githubcli-archive-keyring.gpg \
    && cat $out | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
    && sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
    && echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
    && sudo apt update \
    && sudo apt install gh -y

    gh auth login
    gitStuff
fi
