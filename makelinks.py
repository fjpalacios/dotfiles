from subprocess import call
from os import path


DIRECTORY = ".dotfiles"
OLD_DIRECTORY = ".dotfiles_old"
FILES = ["vimrc", "gitconfig", "gitexcludes", "pylintrc", "zshrc", "tmux.conf",
         "imwheelrc"]

print("Creating ~/{} for backup of any existing dotfiles at home"
      .format(OLD_DIRECTORY))
call(["mkdir", "-p", path.join(path.expanduser("~"), OLD_DIRECTORY)])
call(["cd", path.join(path.expanduser("~"), DIRECTORY)])

print("Moving any existing dotfiles from home to ~/{}".format(OLD_DIRECTORY))

for file in FILES:
    call(["mv", path.join(path.expanduser("~") + "/." + file),
          path.join(path.expanduser("~"), OLD_DIRECTORY)])
    print("Creating a symlink to {} in home directory".format(file))
    call(["ln", "-s", path.join(path.expanduser("~"), DIRECTORY, file),
          path.join(path.expanduser("~"), "." + file)])
