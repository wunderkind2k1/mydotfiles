ICO_NORMAL="\xF0\x9F\x94\xB5" # large blue circle

REPONAMES=

REPODIRS=$(find . -mindepth 2 -maxdepth 2 -name ".git" -type d|sed 's/\.\///'|sed 's/\/\.git//'|sort)
for REPO in $REPODIRS
do
  echo "---"
  REPONAME=$(echo ${REPO}|sed 's/.*\///')
  REPONAMES="${REPONAMES} ${REPONAME}.pb"
  echo -e "${ICO_NORMAL} Processing ${REPONAME}"
  hercules --burndown --burndown-people --devs --pb ${REPO} > ${REPONAME}.pb
done
