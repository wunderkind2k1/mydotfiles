#!/bin/bash

ICO_NORMAL="\xF0\x9F\x94\xB5" # large blue circle

docker run --rm -i -v $(pwd):/io srcd/hercules labours -i /io/hercules-combine.pb -f pb -m devs --max-people 100 --resample M -o /io/devs.png
