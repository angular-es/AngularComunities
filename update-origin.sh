#!/bin/bash -eux
DIR="./origin/"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "${DIR} exist installing and doing stuff"
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "${DIR} not found. Updating origin and cloning the submodule may take long time"
  git submodule add --force https://github.com/angular/angular.git origin  
fi

echo "Checking aio changes in origin..."

aioHash="e0e2157a28"

git -C origin fetch --all
git -C origin reset ${aioHash} --hard

git submodule sync
git submodule update --init

node scripts/sync-origin.js

echo "Finished!"
