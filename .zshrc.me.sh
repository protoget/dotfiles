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