# ynrfin's dotfiles

## Neovim Setup

Link `.config/nvim` not a init.vim

```
ln -s /your/pc/home/.config/nvim /this/dotfile/.config/nvim
```

# Run packer

1. clone packer
2. run :PackerInstall

# Install ripgrep for grep

Windows
```
choco install ripgrep
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


# Windows

### Symlink on windows

Command below will create a symlink of your nvim config folder from your config in dotfiles dir to nvim config folder on `C:` drive

1. Run cmd as Administrator
2. execute
```
mklink /D "C:\Users\<username>\AppData\Local\nvim" "D:\projects\dotfiles\.config\nvim"
```

### Set nvim-qt font on windows

```
    set guifont=FuraMono\ NF:h12
```

**NOTE**: the `FuraMono\ NF` is obtained from the blue colored name when you list all window fonts
