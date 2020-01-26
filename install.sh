#!/bin/bash

install_vimrc()
{
    read -r -p "Install new ~/.vimrc, continue(y/n): " INSTALL_VIMRC
    case $INSTALL_VIMRC in
        Y|y)
            rm -f ~/.vimrc
            ln -s ~/.vim/vimrc ~/.vimrc
            vim +BundleInstall +qall
            ;;
        N|n|*)
            ;;
    esac
}

install_gdftool()
{
    read -r -p "Install new gdftool (linux only), continue(y/n): " INSTALL_GDFTOOL
    # mac and linux install binary is different, but -c -m both have similar behavior
    # so we use here
    case $INSTALL_GDFTOOL in
        Y|y)
            /usr/bin/install -c -m755 ~/.vim/tool/gdf /usr/local/bin/gdf
            /usr/bin/install -c -m755 ~/.vim/tool/gdf_wrapper /usr/local/bin/gdf_wrapper
            ;;
        N|n|*)
            ;;
    esac
}

install_ycm()
{
    read -r -p "Install new ~/.ycm_extra_conf.py, continue(y/n): " INSTALL_YCM
    case $INSTALL_YCM in
        Y|y)
            /usr/bin/install -c -m755 ycm_extra_conf.py ~/.ycm_extra_conf.py
            ;;
        N|n|*)
            ;;
    esac
}

# preprocess
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.tmp

# install file
install_file="vimrc syntax tool"
for f in ${install_file}; do
    cp -r "${f}" ~/.vim/
done

install_vimrc
install_gdftool
install_ycm

# Set shellcheck
apt install shellcheck

# Set YouCompleteMe
apt install build-essential cmake python3-dev
apt install npm
# update npm
npm install npm -g
python3 ~/.vim/bundle/YouCompleteMe/install.py --clang-completer --ts-completer

