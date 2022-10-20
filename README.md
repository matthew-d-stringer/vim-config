# My Config
This config is compatable with CSE 30 pi-clusters.

# Installing
To install:
**Ignore the `setup.sh` file!**
Open your home directory.
Run:
```sh
git clone https://github.com/matthew-d-stringer/vim-config.git
```
Then run:
```sh
ln -sf ~/vim-config/.vimrc ~
```
Then use
```
vim ~/.vimrc
```
to open the configuration file. 
vim should immediately begin downloading the plugins required.
However if it does not, in vim you can run
```
:PlugInstall
```
