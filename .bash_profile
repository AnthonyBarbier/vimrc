#!/bin/bash
export EDITOR=/usr/local/bin/vim
export SVN_EDITOR=/usr/local/bin/vim
export SVN="http://trd-svn1.trondheim.arm.com/svn/mpd/midgard_sw/driver/modules"
export SVNPROD="http://trd-svn1.trondheim.arm.com/svn/mpd/midgard_sw/driver/trunk"
export PS1='\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export SHELL=/bin/bash
export CLEAN_PATH=/home/tony/bin:/usr/local/bin:/usr/bin:/bin:/usr/games:/home/tony/bin:/home/tony/work/ccollab/ccollab_client/
#export CLEAN_PATH=$PATH:~/bin
export ARM_2011_Q1=/home/tony/work/toolchains/arm-2011.03/bin
export ARM_2009_Q3=/home/tony/work/toolchains/arm-2009q3/bin
export ARM_2013_Q2=/home/tony/work/toolchains/arm-2013.05/bin
export ARM_HF_4_7=/home/tony/work/toolchains/gcc-linaro-arm-linux-gnueabihf-4.7-2013.04-20130415_linux/bin
export ARM_HF_4_8=/home/tony/work/toolchains/gcc-linaro-arm-linux-gnueabihf-4.8-2014.02_linux/bin
export PATH=$CLEAN_PATH
export PROMPT_COMMAND='history -a'
export LD_LIBRARY_PATH=.
export CCACHE_DIR=/mydata/ccache
export ADBHOST=10.1.135.21
export HOMEIP=86.22.76.153
export TERM='xterm-256color'
export MAKEOBJDIRPREFIX=$HOME/work/tags
export NO_AT_BRIDGE=1
export ASTYLE_PARAMETERS=" --style=ansi \
--indent=tab \
--indent-classes \
--indent-switches \
--indent-col1-comments \
--min-conditional-indent=0 \
--max-instatement-indent=120 \
--pad-oper \
--align-pointer=name \
--align-reference=name \
--break-closing-brackets \
--keep-one-line-statements \
--max-code-length=120 \
--mode=c \
--lineend=linux \
--indent-preprocessor \
--convert-tabs"

alias apply_astyle='astyle $ASTYLE_PARAMETERS'
alias maketags='mkdir -p $MAKEOBJDIRPREFIX/$(pwd -P) && gtags -i $MAKEOBJDIRPREFIX/$(pwd -P)'
alias maketags_cpp='GTAGSFORCECPP=1 $(maketags)'

alias ls='ls --color=auto'
alias nautilus='nautilus --no-desktop'
alias l='less'
alias strace='strace -s 256'
alias path_2011q1='export PATH=$CLEAN_PATH:$ARM_2011_Q1'
alias path_2009q3='export PATH=$CLEAN_PATH:$ARM_2009_Q3'
alias path_2013q2='export PATH=$CLEAN_PATH:$ARM_2013_Q2'
alias path_hf_4.7='export PATH=$CLEAN_PATH:$ARM_HF_4_7'
alias path_hf_4.8='export PATH=$CLEAN_PATH:$ARM_HF_4_8'
alias path_android='export PATH=$PATH:/home/tony/work/android/android-ndk-r9/:/home/tony/work/android/android-sdk-linux/tools/'
alias path_64_4.8='export PATH=$PATH:/home/tony/work/toolchains/arm64-4.8-2013.09/bin'
alias rsync_cp="rsync -av --progress"
alias markdown_pdf="pandoc -o out.pdf --highlight-style pygments -s"
#alias markdown_html="pandoc -t html5 -o out.html --highlight-style pygments -s"
alias markdown_html="grip --export "
