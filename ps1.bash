# Penguin ps1

PROMPT_COMMAND=prompt

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

function virtualenv_info() {
  venv=$([[ -n "$VIRTUAL_ENV" ]] && echo "${VIRTUAL_ENV##*/}" || echo "")
  [[ -n "$venv" ]] && echo " ($venv)"
}

# disable the default virtualenv prompt change
export VIRTUAL_ENV_DISABLE_PROMPT=1

VENV="\$(virtualenv_info)";

function prompt {
  DEFAULT='\[\e[0m\]'
  DPATH="${BCYAN}\w${DEFAULT}"
  VIRTUALENV="${BYELLOW}${VENV}${DEFAULT}"
  MY_USER="$([ $UID -eq 0 ] && echo "${RED}" || echo "${BGREEN}")\u"

  PS1="[${VIRTUALENV} ${MY_USER} ${DPATH} ] ${YELLOW}$(git_branch)${DEFAULT}$ "
}