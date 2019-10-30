#!/usr/bin/env bash
echoo ">>> Install vim ..."
./configure --with-features=huge \
            --enable-multibyte \
            --enable-pythoninterp \
            #--with-python-config-dir=/usr/lib64/python2.7/config \
            --enable-python3interp \
            #--with-python3-config-dir=/usr/lib/python3.4/config \
            --with-mac-arch=x86_64 \
            --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/local/share/vim/vim80
sudo make install
