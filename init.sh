# Link .vimrc in this repo to home
ln -sf ~/.vim/vimrc ~/.vimrc

# install vim-plug
git submodule update --init --recursive
cd plugged/vim-plug/
git checkout 0.10.0 # current version as of 2018/11/05
cd ../../
ln -sf ~/.vim/plugged/vim-plug/plug.vim ~/.vim/autoload/plug.vim
vim +silent +VimEnter +PlugInstall +qall # install plugins

# Add Colours
ln -sf ~/.vim/plugged/vim-monokai/colors/monokai.vim  ~/.vim/colors/monokai.vim



