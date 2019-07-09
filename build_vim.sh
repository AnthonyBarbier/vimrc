#!/bin/bash
set -e
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd vim-src
sudo apt-get install build-essential cmake python-dev libperl-dev
./configure \
   --enable-multibyte \
   --enable-perlinterp=yes \
   --enable-pythoninterp=yes \
   --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
   --enable-python3interp=yes \
   --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu \
   --enable-cscope \
   --enable-gui=auto \
   --with-features=huge \
   --with-x \
   --enable-fontset \
   --enable-largefile \
   --with-compiledby="Anthony" \
   --prefix=${DIR}/install \
   --enable-fail-if-missing
make -j24
make install
exit 0

sudo apt-get install build-essential cmake python-dev
./configure \
   --enable-multibyte \
   --enable-perlinterp=yes \
   --enable-pythoninterp=yes \
   --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
   --enable-python3interp=yes \
   --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu \
   --enable-luainterp \
   --with-luajit \
   --enable-cscope \
   --enable-gui=auto \
   --with-features=huge \
   --with-x \
   --enable-fontset \
   --enable-largefile \
   --with-compiledby="Anthony" \
   --enable-fail-if-missing

make VIMRUNTIMEDIR=/usr/local/share/vim/vim81 -j24
sudo make install
