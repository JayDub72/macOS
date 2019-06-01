# Lots of aliases to make life easier in shell

# ls aliases
alias l='ls -lFh'
alias la='ls -lAFh'
alias lr='ls -lRFh'
alias lt='ls -ltFh'
alias ll='ls -l'
alias ldot='ls -ld .*'
alias lS='ls -1FSsh'
alias lart='ls -1Fcart'
alias lrt='ls -1Fcrt'

# common aliases to simply life
alias reload!='. ~/.zshrc'
alias cls='clear' # Good 'ol Clear Screen command
alias zshrc='$EDITOR ~/.zshrc' # Quick access to the .zshrc file
alias pj="cd $PROJECTS"

# grep aliases
alias grep='grep --color'
alias sgrep='grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} '

# head/tail/more aliases
alias t='tail -f'
alias m='more '
alias -g H='| head'
alias -g T='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat -A"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"

# find/disk util aliases
alias dud='du -d 1 -h'
alias duf='du -sh *'
alias fd='find . -type d -name'
alias ff='find . -type f -name'

# general aliases
alias h='history'
alias hgrep="fc -El 0 | grep"
alias help='man'
alias p='ps -f'
alias sortnr='sort -n -r'
alias unexport='unset'
alias whereami=display_info
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# alias for homebrew
alias brewup='brew update; brew upgrade; brew cleanup; brew cask upgrade; brew doctor'

# Make zsh know about hosts already accessed by SSH
zstyle -e ':completion:*:(ssh|scp|sftp|rsh|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
