#!/bin/bash

set -eu
get_os() {
  unameOut="$(uname -s)"
  case "${unameOut}" in
      Linux*)     machine=Linux;;
      Darwin*)    machine=Mac;;
      CYGWIN*)    machine=Cygwin;;
      MINGW*)     machine=MinGw;;
      *)          machine="UNKNOWN:${unameOut}"
  esac
  echo ${machine}
}

# Download vim vundle
git clone https://github.com/VundleVim/Vundle.vim.git ${HOME}/.vim/bundle/Vundle.vim

# Download .dotfiles
git clone git@github.com:protoget/dotfiles.git ${HOME}/.dotfiles

# Source .dotfiles/.vimrc from default .vimrc
echo "source ${HOME}/.dotfiles/.vimrc" >> $HOME/.vimrc

# Install all plugins
vim +PluginInstall +qall

# Install powerline fonts
if [[ $(get_os) == "Mac" ]]; then
  git clone https://github.com/powerline/fonts.git --depth=1
  cd fonts
  ./install.sh
  cd ..
  rm -rf fonts
else
  sudo apt-get install fonts-powerline
fi


### Config zsh ###
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo 'source ${HOME}/.dotfiles/.zshrc' >> ${HOME}/.zshrc
