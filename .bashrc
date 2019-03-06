source ~/git-prompt.sh
PROMPT_COMMAND='__posh_git_ps1 "\u@\h:\w" "\\\$ ";'$PROMPT_COMMAND


# path
export PATH="$PATH:$HOME/bin"
# alias
alias l='ls --color=auto'
alias ll='ls -la --color=auto'
alias md='mkdir -pv'
alias ..='cd ..'
# git
git config --global color.ui auto
git config --global core.autocrlf true
git config --global core.safecrlf false
git config --global push.default simple
git config --global alias.h "log --graph --oneline --all --pretty=format:\"%C(yellow)%h%Creset %C(magenta)(%cr)%Creset %C(blue)%cn%Creset %s %C(auto)%d%Creset\""
alias be='vim ~/.bashrc'
alias br='source ~/.bashrc'
alias c='clear'
alias ga='git add -A'
alias gap='git add -p'
alias gc='git commit -m'
alias gcm='git checkout master'
alias gce="git config --global --edit"
alias gcp='git checkout -'
alias gcni='git diff --cached -G "Compile Include" *.csproj'
alias gca='git commit --amend -m'
alias gcan='git commit --amend --no-edit'
alias gcb='git checkout -b'
alias gd='git diff'
alias gdc='git diff --cached'
alias gf='git fetch origin --prune'
alias gg='git log --decorate --oneline --graph'
alias gh='git h'
alias gni='git diff -G "Compile Include" *.csproj'
alias gr='git rev-parse --abbrev-ref HEAD | awk '"'"'{print "origin/"$1}'"'"' | git rebase'
alias gri='git rebase -i'
alias grmu=$'git status -s | grep -i \'^??\' | awk \'{system("rm "$2)}\''
alias grom='git rebase origin/master'
alias gs='git status -s'
alias gsh='git show'
alias prerelease='powershell ./build.ps1 -Target Create-PreRelease-Packages'
alias hosts='vim /c/Windows/system32/drivers/etc/hosts'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
