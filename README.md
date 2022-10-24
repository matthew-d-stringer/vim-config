# My Config
This config is compatable with CSE 30 pi-clusters.

Installing is very quick and should take less than 1 min. 

Click [here](#Installing) to see how to install.

# Use
## Moving between windows
Here is default vim behavior. If familiar, feel free to skip to the next
subsection.

To move between multiple open file windows:
- Use `Ctrl+w j` to move down a window.
- Use `Ctrl+w k` to move up a window.
- Use `Ctrl+w h` to move left a window.
- Use `Ctrl+w l` to move right a window.

To move a window: 
- Use `Ctrl+w J` to move a window to the bottom.
- Use `Ctrl+w K` to move a window to the top.
- Use `Ctrl+w H` to move a window to the far left.
- Use `Ctrl+w L` to move a window to the far right.

## Opening files
By typing `Ctrl+p`, vim will search your current directory to find and open files.
While a file is highlighted, you can use 
- `Enter`to open the file in the current window.
- `Ctrl+v`to open the file with a vertical split
- `Ctrl+x`to open the file with a horizontal split

## Using git
`:G` has been mapped to using git in the terminal.
Thus to stage and commit:
```
:G add -A
:G commit
```
Running `:G commit` will open a file window where you can type in a commit 
message and see what files have been changed.

Finally running `:Gdiffsplit` will show you the `git diff` of the current file 
in vim by using `vimdiff`.

For more git commands in this config, refer to 
[here](https://github.com/tpope/vim-fugitive).

## Compiling
### Default Vim Behavior
- Use `:make` to compile the current file/project.
    - You can also put args into `:make`.
    - E.g. `:make alltests`
- Use `:term` to open the terminal a new file window (horizontal split of window).
    - You can also put commands as arguments into `:term`
    - E.g. `:term make alltests`

### New Behavior
- Use `:VMake` to compile your current file/project in a vetical split terminal
window
    - You can also put args into `:VMake`.
    - E.g. `:VMake alltests`
- Use `:VTerm` to open the terminal in a vertical split window
    - You can also put commands as arguments into `:VTerm`
    - E.g. `:VTerm make alltests`

## Other passive improvements
### Colorscheme
Switch color scheme to better `gruvbox` theme.

### Autopairs
When typing a `{` or similar, vim will automatically add the corresponding `}`.

### Syntastic
When programming, if vim detects a potential error, it will be highlighted in on
the sidebar.
When the cursor is on a line with a syntax error, it will show the error on the
bottom of the screen.

### Airline
The bottom bar has more information and a better colorscheme. 

# Installing
To install:
**Ignore the `setup.sh` file!**
Open your home directory.
Run:
```sh
cd ~
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

# Pulling changes from repo

Sometimes I may update this config and you may want to pull these from git.
To do this, pull the repo as usual:
```sh
git pull
```
Then inside `.vimrc`, run:
```
:PlugClean
:PlugInstall
```
These two vim commands will remove any plugins in the vimrc that have been 
removed, and also install any new ones.
