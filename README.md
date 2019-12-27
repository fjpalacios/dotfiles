# Dotfiles

This is a backup of all my configuration files. If you want to use it first
clone this repository in a new .dotfiles directory in your home, then symlink
the files of your choice. For instance:

```console
$ git clone https://github.com/fjpalacios/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ ln -s ~/.dotfiles/common/.zshrc ~/.zshrc
```
However, this task can be simplified quite a bit with the help of
[GNU Stow](https://www.gnu.org/software/stow/). This way it would be enough
to execute these commands:

```console
$ git clone https://github.com/fjpalacios/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles
$ stow common
```

And all the files contained in the common directory would be symlinked to
the right path.
