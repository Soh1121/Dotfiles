#!/bin/sh
echo 'Hello! from initialize.sh'
cd ~

softwareupdate --install-rosetta

#---------------------------------------------------#
# OS settings                                       #
#---------------------------------------------------#
echo 'start: setup os settings'
defaults write com.apple.finder AppleShowAllFiles TRUE
echo 'complete: setup os settings'

#---------------------------------------------------#
# HomeBrew                                          #
#---------------------------------------------------#
echo 'start: Install HomeBrew'
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update
brew doctor
echo 'complete: Install Homebrew'

echo 'Install from Brewfile'
ln -s ~/Dotfiles/Brewfile ~/Brewfile
brew bundle

#---------------------------------------------------#
# set Dein.vim                                      #
#---------------------------------------------------#
echo 'Setting Dein.vim'
mkdir ~/Dotfiles/.vim/bundles
mkdir ~/Dotfiles/.vim/bundles/.cache
mkdir ~/Dotfiles/.vim/bundles/.cache/.vimrc
mkdir ~/Dotfiles/.vim/bundles/.cache/.vimrc/.dein
cd ~/Dotfiles
curl https://raw.githubusercontent.com/Shougo/dein-installer.vim/master/installer.sh > installer.sh
sh ./installer.sh

#---------------------------------------------------#
# set coc.nvim                                      #
#---------------------------------------------------#
# echo 'Setting coc.nvim'
# brew install node

#---------------------------------------------------#
# Clean setting files                               #
#---------------------------------------------------#
echo 'start: Clean setting files'
rm -rf ~/.vim
rm ~/.viminfo
rm ~/.vimrc
echo 'complete: Clean setting files'

#---------------------------------------------------#
# set Symbolic Links                                #
#---------------------------------------------------#
echo 'start: setup Symbolic Links'
ln -s ~/Dotfiles/.zshrc ~/.zshrc
ln -s ~/Dotfiles/.vim ~/.vim
ln -s ~/Dotfiles/.viminfo ~/.viminfo
ln -s ~/Dotfiles/.vimrc ~/.vimrc
ln -s ~/Dotfiles/.dein ~/.dein

#---------------------------------------------------#
# customize Launchpad                               #
#---------------------------------------------------#
defaults write com.apple.dock springboard-columns -int 10;defaults write com.apple.dock springboard-rows -int 5;defaults write com.apple.dock ResetLaunchPad -bool TRUE
killall Dock

#---------------------------------------------------#
# add .zshrc                                        #
#---------------------------------------------------#
echo 'Setting finished!'

