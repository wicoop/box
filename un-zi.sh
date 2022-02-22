#!/usr/bin/env zsh

MAIN() {
  print -P "Remove ❮ ZI ❯? [y/N]"
  read -r confirmation
  if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then
    print -P "Uninstall process cancelled"
    exit 0
  fi

  clear
  print -P "Removing ❮ ZI ❯ home directory"
  sleep 2

  if [ -d "${HOME}/.zi" ]; then
    rm -rvf "${HOME}/.zi"
  elif [ -d "${ZDOTDIR}/.zi" ]; then
    rm -rvf "${ZDOTDIR}/.zi"
  elif [ -d "${XDG_DATA_HOME}/.zi" ]; then
    rm -rvf "${XDG_DATA_HOME}/.zi"
  fi

  clear
  print -P "Removing ❮ ZI ❯ config directory"
  sleep 2
  if [ -d "${XDG_CONFIG_HOME}/zi" ]; then
    rm -rvf "${XDG_CONFIG_HOME}/zi"
  else
    if [ -d "${HOME}/.config/zi" ]; then
      rm -rvf "${HOME}/.config/zi"
    elif [ -d "${XDG_DATA_HOME}/zi" ]; then
      rm -rvf "${XDG_DATA_HOME}/zi"
    fi
  fi

  clear
  print -P "Reload shell?  [y/N]"
  read -r confirmation
  if [ "$confirmation" != y ] && [ "$confirmation" != Y ]; then
    clear
    print -P "Reload shell skipped"
    print -P "https://github.com/z-shell/zi |  ❮ ZI ❯"
    exit 0
  else
    exec "$SHELL" -l
  fi
}

while true; do
  MAIN "${@}"
done
