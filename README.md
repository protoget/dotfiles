# dotfiles for MacOS
* vim configs: vim vundle, plugins and custom .vimrc
* zsh configs

# Installation:

```sh
./install.sh

# Install zsh and oh-my-zsh
brew install zsh
# Use zsh as default shell
sudo -s 'echo /usr/local/bin/zsh >> /etc/shells' && chsh -s /usr/local/bin/zsh
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo 'source ${HOME}/.dotfiles/.zshrc' >> ${HOME}/.zshrc
```

