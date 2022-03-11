# bones-dotfiles

## Installing

Clone the repo and run the installation script:

    git clone git@github.com:SeanBone/bones-dotfiles.git
    cd bones-dotfiles
    bash -x install.sh   # Verbose run

Note that this may mess with previous installations of vim. Check the install script before running!

Also, don't forget to set the JetBrainsMono patched font as the font for your terminal.

Upon opening vim, use `:PlugInstall` to cause [vim-plug](https://github.com/junegunn/vim-plug) to refresh the plugin installations.

To automatically install the `clangd` language server with the [`coc-clangd`](https://github.com/clangd/coc-clangd) CoC extension, run the command `:CocCommand clangd.install`.
