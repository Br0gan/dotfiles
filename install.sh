#!/bin/bash 
#Move contents to $HOME/.dotfiles
cp -rv ./ $HOME/.dotfiles

# Install Xorg stuff and base16 shell and stuff
sudo pacman -S xorg-xmodmap xorg-xrandr xorg-xprop git termite 

git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

#Symlink bash_profile
ln -svf $HOME/.dotfiles/.bash_profile $HOME/.bash_profile
ln -svf $HOME/.dotfiles/.bashrc $HOME/.bashrc
ln -svf $HOME/.dotfiles/.Xresouces $HOME/.Xresources


source ~/.bashrc

#Apply color scheme
base16-woodland

#Download and setup lemonbar and set i3 config
git clone https://github.com/dark-yux/bar.git 

cd bar
make
sudo cp lemonbar /bin/lemonbar
rm -rfv bar/

ln -svf $HOME/.dotfiles/.bar $HOME/.bar

ln -svf $HOME/.dotfiles/i3/config $HOME/.config/i3/config

#setup node and npm
sudo pacman -S nodejs npm

cd $HOME
mkdir .node_modules

ln -svf $HOME/.dotfiles/.npmrc $HOME/.npmrc

npm install -g webpack

#Install vim and vim-plug and link vimrc
sudo pacman -S vim lua 

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -svf $HOME/.dotfiles/.vimrc $HOME/.vimrc

#SETUP MPD
sudo pacman -S mpd ncmpcpp
cd $HOME
mkdir -p .config/mpd/playlists

for file in $HOME/.dotfiles/mpd/*
do
    ln -svf $file $HOME/.config/mpd
done

sudo systemctl enable mpd.service

