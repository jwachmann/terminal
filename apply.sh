#!/bin/bash

# Install packages
brew install git
brew install fzf
brew install ripgrep
brew install vim
brew install thefuck
brew install shellcheck
brew install ncdu
brew install fd
brew install broot
brew install watch
brew install tmux
brew install tldr
brew install curl
brew install htop
brew install nvm
brew install tfenv
brew install k9s
brew install go
brew install tokei
brew install owasp-zap
brew install wireshark
brew install postman
brew install lolcat
brew install cowsay
brew install fortune
brew install asciiquarium
brew install cmatrix
brew install figlet

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"



##### SETUP ZSH #####

# Apply zsh preferences
cp -i zshrc ~/.zshrc

# Install ZSH plugins
git clone https://github.com/MichaelAquilina/zsh-auto-notify.git $ZSH_CUSTOM/plugins/auto-notify
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone git://github.com/scmbreeze/scm_breeze.git ~/.scm_breeze
~/.scm_breeze/install.sh

# Install terminal theme (Powerlevel10k)
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#p10k configure will automatically run with the next terminal window open



##### SETUP VIM #####

# Apply vim preferences
cp -i vimrc ~/.vimrc

# Install vim plugged (plugin manager)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "To finish setting up VIM please launch it and run ':PlugInstall'"
