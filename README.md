```sh
git clone https://github.com/sakkke/simpledotfiles.git ~/simpledotfiles/home
doas pacman --noconfirm -S - < ~/simpledotfiles/pacman.list
cp -RTfsv ~/simpledotfiles/home ~
cp -RTfsv ~/simpledotfiles/system /
doas sh -c 'chsh -s /usr/bin/zsh "$DOAS_USER"'
```
