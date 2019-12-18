#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5df9a60d1d0d79001b7383bc/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5df9a60d1d0d79001b7383bc
curl -s -X POST https://api.stackbit.com/project/5df9a60d1d0d79001b7383bc/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5df9a60d1d0d79001b7383bc/webhook/build/publish > /dev/null
