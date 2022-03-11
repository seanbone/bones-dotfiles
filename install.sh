#!/bin/bash

# bones-dotfiles installation script

# Install latest NeoVim release
cd ~/.local/bin/
curl -fLo nvim.appimage https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
ln -s nvim.appimage nvim
ln -s nvim.appimage vim

# Make a symlink to this repo's init.nvim
mkdir -p ~/.config/nvim/
ln -s ~/.config/nvim/init.vim init.vim

# Install Node.js, which is required for the CoC completion plugin:
curl -sL install-node.vercel.app/lts | sudo bash

# Install the patched JetBrainsMono font
curl -fLo /tmp/JetBrainsMono.zip https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
mkdir -p /tmp/JetBrainsMono && unzip -qd /tmp/JetBrainsMono /tmp/JetBrainsMono.zip
mkdir -p ~/.local/share/fonts/NerdFonts/
cp '/tmp/JetBrainsMono/JetBrains Mono Regular Nerd Font Complete.ttf' ~/.local/share/fonts/NerdFonts/
