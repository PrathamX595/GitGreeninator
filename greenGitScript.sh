#!/bin/bash

git init

git branch -m "main"

echo "test" >> commit.txt

git add .

git commit -m "lol"


github=$(gh repo create green --private)

github="${github}.git"

git remote add origin $github

git push origin main

git remote -v
