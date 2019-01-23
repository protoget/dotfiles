#!/bin/bash

# Script for quick access to personal wiki
# Note: this script is only runnable via bash.

set -eu

source $HOME/.dotfiles/wiki.sh

usage() {
  echo "$0  [-h|-e] -t [wiki_term]."
	echo "        : A tool to provide easy access to personal wiki."
  echo "      -h: help info."
  echo "      -t: wiki term to search/edit."
  echo "      -e: edit matching wiki file or create a new one."
}

WIKI_TERM=""
MODE="search"

# Parse options
options=$(getopt -o he -l help, -- "$@")
[ $? -eq 0 ] || { 
    echo "Invalid options!"
    exit 1
}
eval set -- "$options"
while true; do
    case "$1" in
    -h)
      usage ;;
    -t)
      WIKI_TERM=$2 ; shift ;;
    -e)
      MODE="edit" ;;
    --)
      shift ; break ;;
    esac
    shift
done

if [[ -z $WIKI_HOME ]]; then
  echo "WIKI_HOME envar is not defined!"
  exit 1
fi

if [[ $MODE != "edit" ]]; then
  # Search mode
  TERM_VARIANTS=("$(capitalize "$TERM")" "$TERM")
  # TODO: dedup TERM_VARIANTS
  
  # mapfile is only available on bash >=4!
  matches=()
  for t in "${TERM_VARIANTS[@]}"; do
    tmp=()
    mapfile -t tmp < <(ls $)
  done
  MATCHES=$(grep


  exit 0
fi


