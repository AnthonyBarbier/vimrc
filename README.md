vim
===

cd ~

git clone https://github.com/AnthonyARM/vim.git .vim

ln -s .vim/vimrc .vimrc
ln -s .vim/vimrc .nvimrc
ln -s .vim .nvim

cd .vim

git submodule init

git submodule update
