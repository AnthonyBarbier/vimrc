#!/bin/bash

#sudo apt-get install build-essential cmake python-dev
#./configure \
#   --enable-multibyte \
#   --enable-perlinterp=yes \
#   --enable-pythoninterp=yes \
#   --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu \
#   --enable-python3interp=yes \
#   --with-python3-config-dir=/usr/lib/python3.6/config-3.6m-x86_64-linux-gnu \
#   --enable-luainterp \
#   --with-luajit \
#   --enable-cscope \
#   --enable-gui=auto \
#   --with-features=huge \
#   --with-x \
#   --enable-fontset \
#   --enable-largefile \
#   --with-compiledby="Anthony" \
#   --enable-fail-if-missing
#
# make VIMRUNTIMEDIR=/usr/local/share/vim/vim81 -j24
#
# sudo make install
git submodule update --init --recursive

cd `dirname $0`/bundle/YouCompleteMe/

python3 install.py --clang-completer --clangd-completer
# Old version
# ./install.sh --clang-completer
