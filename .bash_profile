#exports
export MAVEN_HOME=/Users/n2122141/Applications/apache-maven-3.3.9
export DOCKER_STUFF=/Users/n2122141/projects/dockerstuff/
export SCRIPTS=/Users/n2122141/projects/scripts
export PATH=$PATH:$MAVEN_HOME/bin:$DOCKER_STUFF:$SCRIPTS
export GOPATH="/Users/n2122141/go"

#aliase
alias s='git status'
alias gl='git log --graph --pretty=format:"%C(auto)%h%<(3)%d %s %C(bold blue)(%cr, %an)%Creset" --abbrev-commit --all'
alias ll='git log --graph --pretty=format:"%C(auto)%h%<(3)%d %s %C(bold blue)(%cr, %an)%Creset%n" --abbrev-commit --all --find-copies -M --stat'
alias co='git checkout $1'
alias a='git add $1'
alias aa='git add -A'
alias c='git commit -m $1'
alias bl='git branch -l'
alias bc='git checkout -b $1'
alias bd='git branch -D $1'
alias po='git push origin'
alias pb='git push origin $1'
alias ss='git stash save $1'
alias sl='git stash list'
alias sp='git stash pop $1'
alias m='git merge $1'
alias db='docker_bash.sh $1'
alias dps="docker ps"
alias uc='git reset --hard $1'
alias fp='git fetch;git pull'
