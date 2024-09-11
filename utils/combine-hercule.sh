#!/bin/bash

ICO_NORMAL="\xF0\x9F\x94\xB5" # large blue circle
ICO_FAIL="\xF0\x9F\x94\xA5"

REPONAMES=


echo -e "${ICO_NORMAL} Removing hercules-combine.pb"
rm hercules-combine.pb

REPODIRS=$(find . -name "*.pb" -type f)
for REPO in $REPODIRS
do
  echo ""
  echo -e "${ICO_NORMAL} Processing ${REPO}"
  if [ -s ${REPO} ]; then
    echo -e "${ICO_NORMAL} Adding ${REPO}"
    REPONAMES="${REPONAMES} ${REPO}"
  else
    echo -e "${ICO_FAIL} Skipping ${REPO} - size is zero"
  fi
done

echo -e "${ICO_NORMAL} Combining all to hercules-combine.pb"

hercules combine ${REPONAMES} > hercules-combine.pb
