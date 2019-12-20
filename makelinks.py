from os.path import expanduser
from os.path import isdir
from os.path import join
from subprocess import call

DIRECTORY = '~/.dotfiles'
OLD_DIRECTORY = '~/.dotfiles_old'
FILES = {
    '.vimrc': '~/',
    '.gitconfig': '~/',
    '.gitexcludes': '~/',
    '.pylintrc': '~/',
    '.zshrc': '~/',
    '.tmux.conf': '~/',
    '.imwheelrc': '~/',
    '.chunkwmrc': '~/',
    '.skhdrc': '~/',
    'init.vim': '~/.config/nvim/',
    '.agignore': '~/'
}

print(f'Creating {OLD_DIRECTORY} to backup any existing dotfiles at home')

call(['mkdir', '-p', join(expanduser(OLD_DIRECTORY))])

for path in FILES.values():
    if not isdir(expanduser(path)):
        call(['mkdir', '-p', expanduser(path)])

print(f'Moving any existing dotfiles from home to {OLD_DIRECTORY}')

for file, path in FILES.items():
    file_path = join(expanduser(path), file)
    dotfile = join(expanduser(DIRECTORY), file)
    old_directory = join(expanduser(OLD_DIRECTORY))

    call(['mv', file_path, old_directory])
    print(f'Creating a symlink to {file} in {path}')
    call(['ln', '-s', dotfile, file_path])
