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

# download wget https://github.com/llvm/llvm-project/releases/download/llvmorg-10.0.0/clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
# cp clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz /localdata/anthonyb/vimrc/bundle/YouCompleteMe/third_party/ycmd/cpp/../clang_archives/libclang-10.0.0-x86_64-unknown-linux-gnu.tar.bz2
# tar xf clang+llvm-10.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz in /localdata/anthonyb/vimrc/bundle/YouCompleteMe/third_party/ycmd/third_party/clangd/output
#
# --- a/build.py
# +++ b/build.py
# @@ -1128,7 +1128,7 @@ def EnableClangdCompleter( Args ):
#      if not Args.quiet:
#             print( msg )
#
#              -  DownloadClangd( Print )
#              +  #DownloadClangd( Print )
#
# diff --git a/cpp/ycm/CMakeLists.txt b/cpp/ycm/CMakeLists.txt
# index e5918d75..e52fd6e2 100644
# --- a/cpp/ycm/CMakeLists.txt
# +++ b/cpp/ycm/CMakeLists.txt
# @@ -91,13 +91,9 @@ if ( USE_CLANG_COMPLETER AND
#         "${CMAKE_SOURCE_DIR}/../clang_archives/${LIBCLANG_FILENAME}" )

#             if( EXISTS "${LIBCLANG_LOCAL_FILE}" )
#             -    file( SHA256 "${LIBCLANG_LOCAL_FILE}" LIBCLANG_LOCAL_SHA256 )
#             -
#             -    if( "${LIBCLANG_LOCAL_SHA256}" STREQUAL "${LIBCLANG_SHA256}" )
#             -      set( LIBCLANG_DOWNLOAD OFF )
#             -    else()
#             -      file( REMOVE "${LIBCLANG_LOCAL_FILE}" )
#             -    endif()
#             +    #file( SHA256 "${LIBCLANG_LOCAL_FILE}" LIBCLANG_LOCAL_SHA256 )
#             +    set( LIBCLANG_DOWNLOAD OFF )
#             +    message(WARNING "ALL GOOD")
#
python3 install.py --clang-completer --clangd-completer 
# Old version
# ./install.sh --clang-completer
