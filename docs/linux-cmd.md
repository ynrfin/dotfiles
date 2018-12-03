# Linux Commands

## Process Related

list process by port

`lsof -i :<port_number>`


## Symbolic link

` ln -s ~/.dotfiles/<filename> ~/<filename>`

`-s` for symbolic link instead of hard link
**NOTE** when use `ln -s ` use absolute path for both source & target. or bad
time
