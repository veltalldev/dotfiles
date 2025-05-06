# Enable colors
export TERM=xterm-256color
alias ls='ls --color=auto'
alias ll='ls -la'
alias gs='git status'
alias gl='git log --oneline'

# Better history
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTCONTROL=ignoreboth:erasedups

# Better prompt with git branch
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}
export PS1="\[\033[01;32m\]\u@container\[\033[00m\]:\[\033[01;34m\]\w\[\033[33m\]\$(parse_git_branch)\[\033[00m\]\$ "

# Python virtual env detection
if [ -n "$VIRTUAL_ENV" ]; then
    export PS1="($(basename $VIRTUAL_ENV)) $PS1"
fi
