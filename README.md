Installation:

    git clone https://github.com/jackrvan/dotvim.git ~/.vim

Create symlinks:

    ln -s ~/.vim/vimrc ~/.vimrc

Switch to the `~/.vim` directory, and fetch submodules:

    cd ~/.vim
    git submodule init
    git submodule update --init --recursive

Install ycm:

    apt install build-essential cmake vim-nox python3-dev
    apt install mono-complete golang nodejs default-jdk npm
    cd ~/.vim/bundle/YouCompleteMe
    python3 install.py --all
