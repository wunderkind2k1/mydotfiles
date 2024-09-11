#! /usr/bin/env bash

gh repo list --json id,url,owner,name,defaultBranchRef bayer-int --topic team-cpil-ms-app --limit 1000 --no-archived \
  | jq '.[].url'
