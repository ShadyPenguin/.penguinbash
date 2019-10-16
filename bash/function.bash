# Penguin functions

# Virtualenvs helper
function _venv_usage() {
  echo "Usage: venv <command> [<name>]"
  echo "Commands: new, list, delete, use"
}

function venv() {
  command=$([ -z "$1" ] && echo "usage" || echo "$1")
  name=$([ -z "$2" ] && echo "usage" || echo "$2")
  case "$command" in
    new)
      if [[ "$name" == "usage" ]]; then
        echo -e "ValueError: You must provide a name for the 'new' command.\n"
        _venv_usage
        return 1
      fi
      if [[ $PYTHON_VERSION == "2" ]]; then
        python -m virtualenv "${VENV_LOCATION}$name"
      else
        python3 -m venv "${VENV_LOCATION}$name"
      fi
      ;;
    list)
      ls "${VENV_LOCATION}"
      ;;
    delete)
      if [[ "$name" == "usage" ]]; then
        echo -e "ValueError: You must provide a name for the 'delete' command.\n"
        _venv_usage
        return 1
      fi
      read -p "Are you sure you wish to delete '${name}'? [y/n]: " verify
      [[ $verify == "y" ]] && $(rm -r "${VENV_LOCATION}$name")
      ;;
    use)
      . "${VENV_LOCATION}$name/bin/activate"
      ;;
    usage)
      _venv_usage
      ;;
    *)
      _venv_usage
  esac
}
