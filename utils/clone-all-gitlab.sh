#!/bin/bash

### change these values
# if the token is invalid you will get a jq error "Cannot index string with string "archived""
GITLAB_TOKEN=$GITLAB_TOKEN_GORKSTER
API_URL="https://gitlab.gorkster.de"
REPO_URL="https://gitlab.gorkster.de"
USER_NAME=gork
###

ICO_NORMAL="\xF0\x9F\x94\xB5" # large blue circle
ICO_FAIL="\xF0\x9F\x94\xA5"

# brew install jq
# sudo apt install jq
# choco install jq
if ! command -v jq &> /dev/null
then
    echo "jq could not be found"
    exit 1
fi

if [[ -z ${GITLAB_TOKEN} ]]; then
  echo -e "${ICO_FAIL} GITLAB_TOKEN is not set"
  exit 0
fi

if [[ -z ${API_URL} ]]; then
  echo -e "${ICO_FAIL} API_URL is not set"
  exit 0
fi

if [[ -z ${REPO_URL} ]]; then
  echo -e "${ICO_FAIL} REPO_URL is not set"
  exit 0
fi

if [[ -z ${USER_NAME} ]]; then
  echo -e "${ICO_FAIL} USER_NAME is not set"
  exit 0
fi

DONE=0
PER_PAGE=100
PAGE=0

while [[ $DONE -le 0 ]]; do
  PAGE=$(( $PAGE + 1 ))
  REPOS=$(curl --header "PRIVATE-TOKEN: $GITLAB_TOKEN" "${API_URL}/api/v4/projects?per_page=${PER_PAGE}&page=${PAGE}" | jq -c 'map(select( .archived == false ))' | jq -r '.[].http_url_to_repo')

  if [[ -z ${REPOS} ]]; then
    echo -e "${ICO_NORMAL} DONE WITH $(( $PAGE - 1 )) PAGES"
    DONE=1
  fi

  echo -e "${ICO_NORMAL} PAGE ${PAGE}"

# parameter expansion modes
# ${MYVAR#pattern}     # delete shortest match of pattern from the beginning
# ${MYVAR##pattern}    # delete longest match of pattern from the beginning
# ${MYVAR%pattern}     # delete shortest match of pattern from the end
# ${MYVAR%%pattern}    # delete longest match of pattern from the end
# substrings
# ${MYVAR:3}   # Remove the first three chars (leaving 4..end)
# ${MYVAR::3}  # Return the first three characters
# ${MYVAR:3:5} # The next five characters after removing the first 3 (chars 4-9)
# replace
# ${MYVAR/search/replace}

  for REPOURL in $REPOS
  do
    echo ""
    REPODIRRAW=${REPOURL#"$REPO_URL/"}
    CHECKOUTDIR=${REPODIRRAW%".git"}
    REPODIR=${REPODIRRAW%/*}
    if [ -d "${CHECKOUTDIR}" ]; then
      echo -e "${ICO_FAIL} ${CHECKOUTDIR} exists, skipping"
    else
      echo -e "${ICO_NORMAL} cloning ${REPOURL} into ${ICO_NORMAL} ${CHECKOUTDIR}"
      CURRENT_DIR=$(pwd)
      mkdir -p ${REPODIR}
      cd ${REPODIR}
      git clone ${REPOURL}
      cd ${CURRENT_DIR}
    fi
  done
done
