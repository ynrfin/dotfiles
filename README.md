# ynrfin's dotfiles

## Neovim Setup

Link `.config/nvim` not a init.vim

```
ln -s /your/pc/home/.config/nvim /this/dotfile/.config/nvim

# Run packer

1. clone packer
2. run :PackerInstall
```

# Nvim LSP

### intelephense
```
npm install -g intelephense
```

config:
```lua
lua << EOF
require'lspconfig'.intelephense.setup{}
EOF
```

Because I split config to some files

# OLD README !!!
this is a repo containing my dotfiles. Still in transition into using linux full time

## TODO

[] snippet with nvim-compe
[]make bash for create link and install softwares like vundle

## How To Use

Use `stow` to make symlink to home folder
```bash
stow vim #the vim dir
```

or use manual link for precision

` ln -s ~/.dotfiles/<filename> ~/<filename>`

`-s` for symbolic link instead of hard link
**NOTE** when use `ln -s ` use absolute path for both source & target

## Index
What is contained in this repo:
- Vim configuration `.vimrc`

# How To Install Vim

### 1. Link the vimrc & init.vim

vimrc to -> `~/.vimrc`

init.vim to -> `~/.config/nvim/.init.vim`

### 3. Clone vundle

`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

### 4. Install npm (if not already installed)

`pacman -S npm`

### 5. Install something on coc

`:call coc#util#install()`

done
