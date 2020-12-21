#!/bin/bash -eux
#change the x with the lang of your project
# copy origin to temporary workspace
cd origin
git clean -xdn
cd ..
rsync -ar --delete origin/ .tmp/ 

# overrides files from es directory
rsync -ar aio-x/ .tmp/aio

# build angular.io
cd .tmp
yarn install --frozen-lockfile --non-interactive
cd aio
yarn build

cd ../../

# Copy robots.txt
cp -rf aio-x/src/robots.txt .tmp/aio/dist/

# Modify sitemap
sed -i -e "s/angular.io/angular.x/g" .tmp/aio/dist/generated/sitemap.xml
