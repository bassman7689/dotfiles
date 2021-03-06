#!/bin/bash

backup_file() {
  local SOURCE=$1
  local DEST=${SOURCE}.orig
  mv $SOURCE $DEST
}

create_link() {
  local SOURCE=$1
  local DEST=$2

  if [ ! -L "${DEST}" ]; then
    ln -s $SOURCE $DEST;
  fi
}

create_file_link() {
  local SOURCE=$1
  local DEST=$2

  if [ -f "${DEST}" ] && [ ! -L "${DEST}" ]; then
    backup_file $DEST
    rm $DEST
  fi

  create_link $SOURCE $DEST
}

create_dir_link() {
  local SOURCE=$1
  local DEST=$2

  if [ -d "${DEST}" ] && [ ! -L "${DEST}" ]; then
    echo "directory ${DEST} already exists!"
    return 1
  fi

  create_link $SOURCE $DEST
}

app_exists() {
  local APP=$1
  which $APP >>/dev/null 2>&1
  return $?
}

get_os() {
  uname -s
}

general_install() {
  if app_exists nvim; then
    create_dir_link $PWD/nvim $HOME/.config/nvim
    create_dir_link $PWD/notes $HOME/.notes
  fi

  if app_exists kitty; then
    create_dir_link $PWD/kitty $HOME/.config/kitty
  fi

  if app_exists tmux; then
    create_file_link $PWD/tmux/.tmux.conf $HOME/.tmux.conf
  fi
}

macos_specific_install() {
  # needed for having the app switcher show on the monitor that the
  # dock was shown on lasa.
  defaults write com.apple.Dock appswitcher-all-displays -bool true

  create_link $PWD/bin $HOME/bin
  create_file_link $PWD/git/.gitconfig $HOME/.gitconfig
  create_dir_link $PWD/git/.git-template $HOME/.git-template
}

if [ "$(get_os)" == "Darwin" ]; then
  macos_specific_install
fi

general_install
