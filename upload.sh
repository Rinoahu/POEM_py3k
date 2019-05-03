#!/bin/sh

rm -rf ./database/cog
find ./ -name *un~ | xargs rm
cd example
sh clean.sh
cd ..

git config --global user.email xiaohu@iastate.edu
git config --global user.name Rinoahu


git remote rm origin

git add -A .
git commit -m 'changed test file in example dir'
git remote add origin https://github.com/Rinoahu/POEM_py3k
git pull origin master
git push origin master

git checkout master
