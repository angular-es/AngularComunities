#!/bin/bash -eux
#change the aio-x with the lang of your project
# copy origin to temporary workspace

cd origin
git clean -xdn
cd ..
rsync -ar --delete origin/ .tmp/ 

# overrides files from aio-x directory
rsync -a --exclude='**/*.en.*' --exclude='**/*.old'aio-x/ .tmp/aio

# build angular.io
cd .tmp

yarn install --frozen-lockfile --non-interactive

# build angular.io
cd aio
yarn build

cd ../../