# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# exports
export MAVEN_HOME=
export DOCKER_STUFF=
export SCRIPTS=
# export GOROOT=/Users/sven/sdk/go1.18 #Needed when running multiple go versions https://go.dev/doc/manage-install
export GOPATH=$HOME/go
export AWSCLIPATH=$HOME/aws-cli
export FLUTTER_SDK_BIN_PATH=$HOME/projects/flutter-sdk/flutter-3.3.4/bin
export HOME_BIN=$HOME/bin
export PATH=$PATH:$MAVEN_HOME/bin:$DOCKER_STUFF:$SCRIPTS:$GOPATH/bin:$AWSCLIPATH:$FLUTTER_SDK_BIN_PATH:$HOME_BIN:$HOME/.cargo/bin
# gpg git support
export GPG_TTY=$(tty)

# java 17 (techem)
export JAVA_HOME="/opt/homebrew/Cellar/openjdk@17/17.0.15/libexec/openjdk.jdk/Contents/Home"
export PATH="$JAVA_HOME/bin":$PATH

# aliases

# aliases
# git
alias s='git status'
alias gl='git log --graph --pretty=format:"%C(auto)%h%<(3)%d %s %C(bold blue)(%cr, %an)%Creset" --abbrev-commit --all'
alias ll='git log --graph --pretty=format:"%C(auto)%h%<(3)%d %s %C(bold blue)(%cr, %an)%Creset%n" --abbrev-commit --all --find-copies -M --stat'
alias lb='git log --oneline --graph --pretty'
alias lss='git log --show-signature'
alias co='git checkout $1'
alias a='git add $1'
alias aa='git add -A'
alias c='git commit -m $1'
alias cs='git commit -S -m $1'
alias csm='git commit -S'
alias bl='git branch -l'
alias bc='git checkout -b $1'
alias bd='git branch -D $1'
alias bm='git branch -m $(git branch --show-current) $1'
alias po='git push origin --follow-tags'
alias pb='git push origin $1'
alias ss='git stash save $1'
alias sl='git stash list'
alias sp='git stash pop $1'
alias gsa='git stash apply $1'
alias m='git merge $1'
alias uc='git reset --hard $1'
alias fp='git fetch;git pull'
alias fup='git fetch upstream'
alias mu='git merge upstream/master'
alias suo='git push --set-upstream origin $(git branch --show-current)'
alias fu='git add . && git commit --amend -C HEAD && git push -f'

# docker
alias db='docker_bash.sh $1' #needs docker bash script
alias dps='docker ps'
alias dcl='docker container ls'
alias dcla='docker container ls -a'
alias dcs='docker container start $1'
alias dcst='docker container stop  $1'
alias dil='docker image ls'
alias dila='docker image ls -a'
alias dspa='docker system prune -a --volumes'
# go
# alias go=go1.18 #point to the version of your choice https://go.dev/doc/manage-install
alias gta='go test ./...' #run all tests in file hierachy
# taskwarrior/taskwarrior-tui
alias tt=taskwarrior-tui
alias tn='task +next'

# other
# markdown
alias g='glow'

export PATH="/usr/local/opt/mysql-client/bin:$PATH"

#powerlevel10k
source ~/projects/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

autoload -Uz compinit && compinit

# https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/mc mc

source /Users/sven/.docker/init-zsh.sh || true # Added by Docker Desktop

complete -o nospace -C /usr/local/bin/terraform terraform


# cli pomodoro. original source: https://gist.github.com/bashbunni/f6b04fc4703903a71ce9f70c58345106 
# Requires https://github.com/caarlos0/timer to be installed
# brew install caarlos0/tap/timer

# Mac setup for pomo
work() {
  timer "${1:-60m}" && terminal-notifier -message 'Pomodoro' \
    -title 'Work Timer is up! Take a Break 😊' \
    -sound Crystal
}
       

rest() {
  timer "${1:-15m}" && terminal-notifier -message 'Pomodoro' \
    -title 'Break is over! Get back to work 😊' \
    -sound Crystal
}
