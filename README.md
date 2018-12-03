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
