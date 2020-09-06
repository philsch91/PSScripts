alias ls="ls -lh"
alias ll="ls -lh"
alias lla="ls -lah"
alias cd..="cd .."
alias cd...="cd ../.."
alias ..="cd .."
alias ...="cd ../.."
alias diff="diff -bs"
#alias diff="diff -qnbs"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
export LANG=en_US.UTF-8
#alias git='LANG=en_US git'
#alias git='LC_ALL=en_US git'
alias gitcheck="git diff --check"
#git() { if [ $1 = "check" ]; then command git diff --check; else command git "$@"; fi }
