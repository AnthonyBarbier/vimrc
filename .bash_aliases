export PATH=/home/anthonyb/scratch/vimrc/install/bin:/home/anthonyb/bin:$PATH
export TF_POPLAR_SANDBOX=/scratch/anthonyb/workspace/poplar/build_release/install/
alias apply_astyle='astyle $ASTYLE_PARAMETERS'

#alias maketags='mkdir -p $MAKEOBJDIRPREFIX/$(pwd -P) && gtags -i $MAKEOBJDIRPREFIX/$(pwd -P)'
#alias maketags_cpp='GTAGSFORCECPP=1 $(maketags)'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias nautilus='nautilus --no-desktop'
alias l='less'
alias strace='strace -s 256'

alias rsync_cp="rsync -av --progress"
alias markdown_pdf="pandoc -o out.pdf --highlight-style pygments -s"
#alias markdown_html="pandoc -t html5 -o out.html --highlight-style pygments -s"
alias markdown_html="grip --export "
alias go="xdg-open"
alias v="vim"
alias envg="env | grep "
alias gitc='git checkout'
alias gits='git status'
alias gitr='git reset'
alias gitl='git log'
alias gitlm='git log origin/master'
alias gitm='git mergetool'
alias gitd='git diff'
alias gh='gerrit_head'
alias gd='git diff'
alias ga='git commit --amend'
alias gs='git status'
alias gf='git fetch -p'
alias gfc='git fetch -p && git checkout origin/master'

#alias gerrit_head_release='git push origin HEAD:refs/for/branches/arm_compute_17_06'
alias myalert='notify-send --urgency=critical -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias myalerttxt='notify-send --urgency=critical '

# Clever Ctrl-r: https://launchpad.net/ubuntu/disco/amd64/fzf/0.17.5-2
source /usr/share/doc/fzf/examples/key-bindings.bash
