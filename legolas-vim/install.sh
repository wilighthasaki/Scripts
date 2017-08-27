#!/usr/bin/env bash
set -e
set -o pipefail

function echoo {
    echo -e "\033[32m $1 \033[0m"
}

if [[ $1 != "INIT" ]]; then
    echoo "if need install or reinstall legolas-vim, please run: ./install.sh INIT"
    exit 1
fi

function backup {
    echoo ">>> Backing up old vim configs"

    now=`date +%Y%m%dT%H-%M-%S`
    for i in $HOME/.vim $HOME/.vimrc; do
        echoo $i' --> '$i.$now
        [ -e $i ] && sudo mv $i $i.$now
    done

    echoo ">>> backup finished"
}

platform=""
for i in "Centos","Centos" "Ubuntu","Ubuntu" "Darwin","MacOSX"; do
    key=${i%,*}; value=${i#*,};
    if [ `python -mplatform | grep -ic  $key` == 1 ]; then
       platform=$value
       echoo ">>> You os is $platform."
    fi
done


backup

sudo bash scripts/init-vim-ubuntu.sh

sudo bash install-plugins.sh init

echoo "Install finished. If you need orther language support, please run: ./install-plugins.sh --help"
