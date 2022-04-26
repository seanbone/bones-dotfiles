#!/bin/bash

# bones-dotfiles installation script

# Install latest NeoVim release
sudo apt install neovim

# Make a symlink to this repo's init.nvim
mkdir -p ~/.config/nvim/
ln -s `realpath init.vim` ~/.config/nvim/init.vim

# Install curl (required for installation)
sudo apt install curl

# Install Node.js, which is required for the CoC completion plugin:
curl -sL install-node.vercel.app/lts | sudo bash

# Install the patched JetBrainsMono font
curl -fLo /tmp/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
mkdir -p /tmp/JetBrainsMono && unzip -qd /tmp/JetBrainsMono /tmp/JetBrainsMono.zip
mkdir -p ~/.local/share/fonts/NerdFonts/
cp '/tmp/JetBrainsMono/JetBrains Mono Regular Nerd Font Complete.ttf' ~/.local/share/fonts/NerdFonts/

# Install vim plugins
vim --headless -c "PlugInstall" -c "qall"

# Install clangd
vim --headless -c "CocCommand clangd.install" -c "qall" /tmp/whatever.cpp
