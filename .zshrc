# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#export PATH="/usr/local/opt/mysql-client/bin:$PATH"
#exports
export MAVEN_HOME=
export DOCKER_STUFF=
export SCRIPTS=
export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go
export AWSCLIPATH=$HOME/aws-cli
export PATH=$PATH:$MAVEN_HOME/bin:$DOCKER_STUFF:$SCRIPTS:$GOPATH/bin:$GOROOT/bin:$AWSCLIPATH
#gpg git support
export GPG_TTY=$(tty)
#aliase

#git
alias s='git status'
alias gl='git log --graph --pretty=format:"%C(auto)%h%<(3)%d %s %C(bold blue)(%cr, %an)%Creset" --abbrev-commit --all'
alias ll='git log --graph --pretty=format:"%C(auto)%h%<(3)%d %s %C(bold blue)(%cr, %an)%Creset%n" --abbrev-commit --all --find-copies -M --stat'
alias lb='git log --oneline --graph --pretty'
alias co='git checkout $1'
alias a='git add $1'
alias aa='git add -A'
alias c='git commit -m $1'
alias cs='git commit -S -m $1'
alias csm='git commit -S'
alias bl='git branch -l'
alias bc='git checkout -b $1'
alias bd='git branch -D $1'
alias po='git push origin --follow-tags'
alias pb='git push origin $1'
alias ss='git stash save $1'
alias sl='git stash list'
alias sp='git stash pop $1'
alias m='git merge $1'
alias uc='git reset --hard $1'
alias fp='git fetch;git pull'
alias fu='git fetch upstream'
alias mu='git merge upstream/master'
alias suo='git push --set-upstream origin $(git branch --show-current)'

#docker
alias db='docker_bash.sh $1' #needs docker bash script
alias dps='docker ps'
alias dcl='docker container ls'
alias dcla='docker container ls -a'
alias dcs='docker container start $1'
alias dcst='docker container stop  $1'
alias dil='docker image ls'
alias dila='docker image ls -a'

#go
alias gta='go test ./...' #run all tests in file hierachy

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/sven/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/sven/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/sven/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/sven/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
source ~/projects/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
