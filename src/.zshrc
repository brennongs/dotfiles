# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation. 
export ZSH="/home/$USERNAME/.oh-my-zsh" 
export KEYTIMEOUT=1
export WORKON_HOME="~/Codes/.env"
export DEFAULT_USER=$USER

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# Powerlevel9k settings
POWERLEVEL9K_MODE="nerdfont-complete"
# POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=""
POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=""
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=""
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=""
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="$ "
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"

POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND="none"
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND="grey"
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND="grey"
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND="white"

POWERLEVEL9K_CONTEXT_TEMPLATE="%BSSH:%b %U%F{red}$USER%f%u%F{grey}@%F{blue}`hostname`%f"
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND="none"
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND="blue"

POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_DIR_ETC_BACKGROUND="none"
POWERLEVEL9K_DIR_ETC_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_BACKGROUND="none"
POWERLEVEL9K_DIR_HOME_FOREGROUND="magenta"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="none"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="yellow"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="none"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="magenta"

POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_OK_BACKGROUND="none"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="none"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"

POWERLEVEL9K_VCS_CLEAN_FOREGROUND="cyan"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="none"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="none"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="red"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="none"
POWERLEVEL9K_VCS_SHORTEN_LENGTH="20"
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH="20"
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_right"

POWERLEVEL9K_TIME_BACKGROUND="none"
POWERLEVEL9K_TIME_FOREGROUND="white"
POWERLEVEL9K_TIME_FORMAT="%D{%l:%M:%S %P}"

POWERLEVEL9K_VIRTUALENV_BACKGROUND="067"
POWERLEVEL9K_VIRTUALENV_FOREGROUND="221"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  vi_mode
  status
  context
  dir
)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  vcs
  virtualenv
  time
)

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  django
  web-search
  zsh-syntax-highlighting
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh
# User configuration
source /usr/local/bin/virtualenvwrapper.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vim"
else
  export EDITOR="vim"
fi


# ssh
export SSH_KEY_PATH="~/.ssh/ecdsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias zource="source ~/.zshrc"
alias zp="vim ~/.zshrc"
alias pp="vim ~/.psqlrc"
alias sp="vim ~/.ssh/config"
alias omp="vim ~/.oh-my-zsh"
alias k="clear"
alias python="python3"
alias pip="pip3"
alias mkve="mkvirtualenv"
alias rmve="rmvirtualenv"
alias django="python manage.py"
alias update="sudo apt update && sudo apt upgrade -y"
alias s='sudo'

bindkey -v
bindkey "^R" history-incremental-search-backward
unsetopt prompt_cr prompt_sp

function = {
  local IFS=" "
  local calc="${*//p/+}"
  calc="${calc//x/*}"
  echo "$(($calc))"
}

function check_for_virtual_env {
  [ -d .git ] || git rev-parse --git-dir &> /dev/null

  if [ $? -eq 0 ]; then
    local ENV_NAME=`basename \`pwd\``

    if [ "${VIRTUAL_ENV##*/}" != $ENV_NAME ] && [ -e $WORKON_HOME/$ENV_NAME/bin/activate ]; then
      workon $ENV_NAME && export CD_VIRTUAL_ENV=$ENV_NAME
    fi
  elif [ $CD_VIRTUAL_ENV ]; then
    deactivate && unset CD_VIRTUAL_ENV
  fi
}

function cd {
  builtin cd "$@" && check_for_virtual_env
}

function mkurl {
  echo $1 | tr -d '\│\n\|\ \\'
}

check_for_virtual_env