#!/usr/bin/env zx

cd('/');
await $`rsync -a --exclude='**/*.en.*' --exclude='**/*.old' aio-x/ origin/aio`;
cd('/origin');

