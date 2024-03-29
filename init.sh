# Link .vimrc in this repo to home
ln -sf ~/.vim/vimrc ~/.vimrc

# install vim-plug
git submodule update --init --recursive
cd plugged/vim-plug/
git checkout 0.10.0 # current version as of 2018/11/05
cd ../../
mkdir -p autoload
ln -sf ~/.vim/plugged/vim-plug/plug.vim ~/.vim/autoload/plug.vim
vim +silent +VimEnter +PlugInstall +qall # install plugins

# Add Colours
mkdir -p colors
ln -sf ~/.vim/plugged/vim-monokai/colors/monokai.vim  ~/.vim/colors/monokai.vim

# Update bashrc with my changes
cat bashrc >> ~/.bashrc
#TODO: add a check for this line so I dont have it writting a million times into ~/.bashrc
echo "export PATH=$(pwd)/bin/:\$PATH" >> ~/.bashrc
