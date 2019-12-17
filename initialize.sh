#!/bin/sh
echo 'Hello! from initialize.sh'
cd ~

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
/usr/bin/ruby -e "$(/usr/bin/curl -fksSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
brew update
brew doctor
echo 'complete: Install Homebrew'

echo 'Installing git...'
brew install git

echo 'Installing openssl...'
brew install openssl

echo 'Installing ghq...'
brew install ghq
git config --global ghq.root ~/src

#---------------------------------------------------#
# set Dein.vim                                      #
#---------------------------------------------------#
echo 'Setting Dein.vim'
mkdir ~/Dotfiles/.vim/bundles
cd ~/Dotfiles
sh ./installer.sh ~/.vim/bundles

#---------------------------------------------------#
# set TMUX                                          #
#---------------------------------------------------#
echo 'Setting TMUX'
brew install tmux

#---------------------------------------------------#
# set tig                                           #
#---------------------------------------------------#
echo 'Setting tig'
brew install tig

#---------------------------------------------------#
# set fzf                                           #
#---------------------------------------------------#
echo 'Setting fzf'
brew install fzf
brew install ripgrep

#---------------------------------------------------#
# set coc.nvim                                      #
#---------------------------------------------------#
echo 'Setting coc.nvim'
brew install node

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
ln -s ~/Dotfiles/.vim ~/.vim
ln -s ~/Dotfiles/.viminfo ~/.viminfo
ln -s ~/Dotfiles/.vimrc ~/.vimrc
ln -s ~/Dotfiles/.dein ~/.dein
ln -s ~/Dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/Dotfiles/.tigrc ~/.tigrc

#---------------------------------------------------#
# add .zshrc                                        #
#---------------------------------------------------#
echo 'Setting finished!'
echo 'add alias to .zshrc: alias t='tmux''
echo 'add settings for fzf to .zshrc: setting for fzf'
