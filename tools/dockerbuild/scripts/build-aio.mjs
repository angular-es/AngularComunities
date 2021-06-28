#!/usr/bin/env zx

await import('./apply-localization.mjs');
cd('/origin/aio');
await $`yarn build`;
await $`cp -f ../../aio-x/src/robots.txt ./dist/`;
await $`sed -i -e "s/angular.io/angular.x/g" ./dist/generated/sitemap.xml`;
