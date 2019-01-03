from subprocess import call
from os import path
from pathlib import Path


DIRECTORY = '.dotfiles'
OLD_DIRECTORY = '.dotfiles_old'
FILES = ['vimrc', 'gitconfig', 'gitexcludes', 'pylintrc', 'zshrc', 'tmux.conf',
         'imwheelrc', 'chunkwmrc', 'skhdrc', 'init.vim']

print(f'Creating ~/{OLD_DIRECTORY} to backup any existing dotfiles at home')

call(['mkdir', '-p', path.join(Path.home(), OLD_DIRECTORY)])
call(['cd', path.join(Path.home(), DIRECTORY)], shell=True)

call(['mkdir', '-p', path.join(Path.home(), '.config', 'nvim')])

print('Moving any existing dotfiles from home to ~/{}'.format(OLD_DIRECTORY))

for file in FILES:
    if file == 'init.vim':
        call(['mv', path.join(str(Path.home()), '.config', 'nvim', file),
              path.join(Path.home(), OLD_DIRECTORY)])
        print(f'Creating a symlink to {file} within its .config directory')
        call(['ln', '-s', path.join(Path.home(), DIRECTORY, file),
             path.join(Path.home(), '.config', 'nvim', file)])
    else:
        call(['mv', path.join(str(Path.home()), '.' + file),
             path.join(Path.home(), OLD_DIRECTORY)])
        print(f'Creating a symlink to .{file} in home directory')
        call(['ln', '-s', path.join(Path.home(), DIRECTORY, file),
             path.join(Path.home(), '.' + file)])
