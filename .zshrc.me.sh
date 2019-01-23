plugins=(git, history-substring-search)

bindkey -v

# Use control + R to turn on bck-i-search
# Then type a few words, zsh would do the matching. Keep pressing
# ^R to iterate through matches, in reverse chronological order.
bindkey '^R' history-incremental-search-backward

# ^[[A is the actual code sent when pressing UP key, similar for ^[[B.
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Byobu
alias byobu_resize='/usr/lib/byobu/include/tmux-detach-all-but-current-client'

# Show ubuntu version.
alias ubuntu_version='lsb_release -a'

# Vim
vim_plugin() {
  local cmd=$1
  if [[ $cmd != install ]]; then
    echo 'Only "install" cmd is supported for now'
    exit 1
  fi
  vim +PluginInstall +qall
}

print_array() {
  printf '%s\n' "$@"
}


grep_zshrc() {
  # Grep matching patterns in all zshrcs in $CUSTOM_ZSHRC
  local pat="$1"
  # grep
  # -h: no-filename
  # -o: only matched content
  echo "$(grep -roh "$pat" ${CUSTOM_ZSHRC[@]})"
}

zfun() {
  usage () {
    echo 'zfun                 : A tool to query custom zsh functions defined in $CUSTOM_ZSHRC.'
    echo "      -h             : dump help info."
    echo '      -l             : list all functions defined in $CUSTOM_ZSHRC.'
    echo '      -a             : search alias. Default is to search functions.'
    echo "      -p [func_name] : print content of zsh function [func_name]."
  }
  # Use getopts in a function, must use a local OPTIND
  local OPTIND o func_name is_alias cmd pat
  while getopts ":hlap:" o; do
    case "${o}" in
      h)
        usage
        return 0
        ;;
      l)
        if [[ -n $cmd ]]; then
          echo "Conflicting cmd: $cmd vs. list!"
          return 1
        fi
        cmd="list" ;;
      p)
        if [[ -n $cmd ]]; then
          echo "Conflicting cmd: $cmd vs. print!"
          return 1
        fi
        func_name="$OPTARG"
        cmd="print"
        ;;
      :)
        echo "Option -$OPTARG requires an argument."
        return 1 ;;
      a)
        is_alias="true" ;;
      *)
        usage
        return 1
        ;;
    esac
  done
  shift $((OPTIND-1))

  if [[ $cmd = "list" ]]; then
    if [[ -n $is_alias ]]; then
      pat='alias [a-zA-Z_]*=.*'
    else
      pat='^[a-zA-Z_]*()'
    fi
    # Get result into an array
    local result=()
    while IFS= read -r line; do
      result+=( $line )
    done < <(grep_zshrc "$pat")
    # Print each item in a new line
    print_array "${result[@]}"
  elif [[ $cmd == "print" ]]; then
    if [[ -n $is_alias ]]; then
      pat="alias $func_name=.*"
    else
      pat="$func_name()"
    fi
    local found_entry="$(grep_zshrc $pat)"
    if [[ -z $found_entry ]]; then
      if [[ -z $is_alias ]]; then
        echo "function: $func_name not found!"
      else
        echo "alias: $func_name not found"
      fi
    else
      if [[ -n $is_alias ]]; then
        echo "$found_entry"
      else
        whence -f "$func_name"
      fi
    fi
  else
  fi
}

