#!/bin/bash
GREEN='\033[0;92m'
RESET='\033[0m'

if [ -f /usr/bin/gh ]
then
    read -p "$(echo -e "Enter the number of Days from which you want your github$GREEN Green$RESET: ")" days
    
    echo "Doing the hard work...."
    
    mkdir justARepo
    
    cd justARepo
    
    git init &> /dev/null
    
    git branch -m "main" 
    
    for ((i=$days; i>=0; i--))
    do
        echo "test" >> commit.txt
    
        git add .
    
        git commit --date "$i day ago" -m "update on secret Project" &> /dev/null 
    done
    
    github=$(gh repo create secretRepo --private)     #make sure there is no previous repo by the same name
    
    github="${github}.git"
    
    git remote add origin $github &> /dev/null
    
    git push origin main &> /dev/null
    
    echo -e "work done chief your github is$GREEN green$RESET"
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
    
    read -p "$(echo -e "Enter the number of Days from which you want your github$GREEN Green$RESET: ")" days
    
    echo "Doing the hard work...."
    
    mkdir justARepo
    
    cd justARepo
    
    git init &> /dev/null
    
    git branch -m "main" 
    
    for ((i=$days; i>=0; i--))
    do
        echo "test" >> commit.txt
    
        git add .
    
        git commit --date "$i day ago" -m "update on secret Project" &> /dev/null 
    done
    
    github=$(gh repo create secretRepo --private)     #make sure there is no previous repo by the same name
    
    github="${github}.git"
    
    git remote add origin $github &> /dev/null
    
    git push origin main &> /dev/null
    
    echo -e "work done chief your github is$GREEN green$RESET"
fi