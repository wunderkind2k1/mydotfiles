#! /usr/bin/env bash

cd /usr/local/Cellar

# https://stackoverflow.com/questions/40919442/sorting-installed-brew-packages-by-install-size
du -hs * | sort -h
