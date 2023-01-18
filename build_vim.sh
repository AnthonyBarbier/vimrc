#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd vim-src
# g++-8 needed for YCM
#sudo apt-get install build-essential cmake python-dev libperl-dev libncurses-dev python python3 python3-dev ruby ruby-dev libx11-dev libxt-dev libgtk2.0-dev  libncurses5  ncurses-dev g++-8 -y
# Ubuntu 22:
#sudo apt-get install build-essential cmake python2-dev python2 python-dev-is-python3 libperl-dev libncurses-dev -y
./configure \
   --enable-multibyte \
   --enable-perlinterp=yes \
   --enable-python3interp=yes \
   --with-python3-command=python3 \
   --enable-cscope \
   --enable-gui=auto \
   --with-features=huge \
   --with-x \
   --enable-fontset \
   --enable-largefile \
   --with-compiledby="Anthony" \
   --prefix=${DIR}/install \
   --enable-fail-if-missing
make -j80
make install
exit 0

