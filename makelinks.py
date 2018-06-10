from subprocess import call
from os import path
from pathlib import Path


DIRECTORY = ".dotfiles"
OLD_DIRECTORY = ".dotfiles_old"
FILES = ["vimrc", "gitconfig", "gitexcludes", "pylintrc", "zshrc", "tmux.conf",
         "imwheelrc"]

print("Creating ~/{} for backup of any existing dotfiles at home"
      .format(OLD_DIRECTORY))
call(["mkdir", "-p", path.join(Path.home(), OLD_DIRECTORY)], shell=True)
call(["cd", path.join(Path.home(), DIRECTORY)], shell=True)

print("Moving any existing dotfiles from home to ~/{}".format(OLD_DIRECTORY))

for file in FILES:
    call(["mv", path.join(Path.home() + "/." + file),
          path.join(Path.home(), OLD_DIRECTORY)], shell=True)
    print("Creating a symlink to {} in home directory".format(file))
    call(["ln", "-s", path.join(Path.home(), DIRECTORY, file),
          path.join(Path.home(), "." + file)], shell=True)
