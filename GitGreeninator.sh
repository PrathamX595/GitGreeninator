#!/bin/bash
GREEN='\033[0;92m'
RESET='\033[0m'
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

