# ynrfin's dotfiles

this is a repo containing my dotfiles. Still in transition into using linux full time

## TODO
make bash for create link and install softwares like vundle

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
