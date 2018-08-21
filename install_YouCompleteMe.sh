#!/bin/bash

#sudo apt-get install build-essential cmake python-dev
git submodule update --init --recursive

cd `dirname $0`/bundle/YouCompleteMe/

./install.sh --clang-completer
