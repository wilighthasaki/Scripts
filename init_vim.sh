#!/usr/bin/env bash
echoo ">>> Install vim ..."
git clone https://github.com/vim/vim.git
cd vim
./configure --with-features=huge --enable-multibyte --enable-pythoninterp \
    --with-python-config-dir=/usr/lib64/python2.7/config \
    --with-python-command=/usr/bin/python \
    --enable-gui=gtk2 --enable-cscope --prefix=~/data/vim8
make -j4 VIMRUNTIMEDIR=~/data/vim8/vim_runtime
make install 
echo "PATH=/home/shaowenliang/data/vim8/bin:\$PATH" >> ~/.bashrc
