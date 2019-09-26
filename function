# Penguin functions

# Virtualenvs helper
function venv_usage() {
  echo "Usage: venv <command> [<name>]"
  echo "Commands: new, list, delete, use"
}

# TODO: dry the empty 'name' portion
function venv() {
  venv_location="/Users/$(whoami)/.virtualenvs/"
  command=$([ -z "$1" ] && echo "usage" || echo "$1")
  name=$([ -z "$2" ] && echo "usage" || echo "$2")
  case "$command" in
    new)
      if [[ "$name" == "usage" ]]; then
        echo -e "ValueError: You must provide a name for the 'new' command.\n"
        venv_usage
        return 1
      fi
      python3 -m venv "$venv_location/$name"
      ;;
    list)
      ls "$venv_location"
      ;;
    delete)
      if [[ "$name" == "usage" ]]; then
        echo -e "ValueError: You must provide a name for the 'delete' command.\n"
        venv_usage
        return 1
      fi
      read -p "Are you sure you wish to delete '${name}'? [y/n]: " verify
      [[ $verify == "y" ]] && $(rm -r "$venv_location/$name")
      ;;
    use)
      . "$venv_location/$name/bin/activate"
      ;;
    usage)
      venv_usage
      ;;
    *)
      venv_usage
  esac
}