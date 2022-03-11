# bones-dotfiles
This repository is a personal utility for myself to have a "standardised" neovim installation. It has many plugins for a fairly customised experience.

Some of the highlights:
- Semantic completion with [Conquer of Completion](https://github.com/neoclide/coc.nvim).
- [NERDTree](https://github.com/preservim/nerdtree) for directory navigation. Toggle with `<C-t>`.
- [Dashboard](https://github.com/glepnir/dashboard-nvim) for easy sessions and a nice splash screen.
- Fuzzy search with [fzf.vim](https://github.com/junegunn/fzf.vim). Hit `ö` to search files in repository (skipping files from `.gitignore`).
- Proper indentation handling with [vim-sleuth](https://github.com/tpope/vim-sleuth) and [indentLine](https://github.com/Yggdroot/indentLine)
- [Auto-save](https://github.com/907th/vim-auto-save) functionality
- Basic functionality to easily build/run/test code with GNU Make:
    - `<F4>`: calls the `_vim_build` target from `vim.makefile`
    - `<F5>`: calls the `_vim_run` target from `vim.makefile`
    - `<F6>`: calls the `_vim_test` target from `vim.makefile`
    - `<F9>`: calls the `_vim_clean` target from `vim.makefile`
- Some custom keybinds:
    - `Ctrl-Tab` to cycle tabs
    - `<` and `>` to navigate buffers
    - `<C-w>` to close the current buffer
    - `<C-q>` to close vim (`:qa`)

## Installing (Ubuntu)

Clone the repo and run the installation script:

    git clone git@github.com:SeanBone/bones-dotfiles.git
    cd bones-dotfiles
    bash -x install.sh   # Verbose run

Note that this may mess with previous installations of vim. Check the install script before running!

Also, don't forget to set the JetBrainsMono patched font as the font for your terminal.

Upon opening vim, use `:PlugInstall` to cause [vim-plug](https://github.com/junegunn/vim-plug) to refresh the plugin installations.

To automatically install the `clangd` language server with the [`coc-clangd`](https://github.com/clangd/coc-clangd) CoC extension, run the command `:CocCommand clangd.install`.
