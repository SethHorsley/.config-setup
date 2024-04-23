# This is my dev setup

run the auto-setup script in terminal

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/iseth/.config-setup/main/bin/auto-setup)"
```

the `bin/auto-setup` script will run the following

1. `bin/core-setup` to install brew and yq for the next step
2. `bin/brew-setup` this will install everything from `./to-install.yml`
3. `bin/config-setup` will sym link the `~/.config` files to home (`~`)

all `.config` files should stay in this repo because they are sym linked to the home and they are tracked here

1. run setup script
2. script will download and install brew and xcode-select and git
3. install 1password and then open it to login
4. once logged in the
5. check if brew and xcode-select are installed and install them

after the installation to configure iterm2 go to iterm settings > profile >colors
and download this theme:
https://github.com/mbadolato/iTerm2-Color-Schemes/blob/master/schemes/tokyonight.itermcolors

and then load it into the profile
