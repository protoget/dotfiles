# A bunch of useful bash util methods

capitalize() {
  arg=$1
  echo "$(tr '[:lower:]' '[:upper:]' <<< ${arg:0:1})${arg:1}"
}

