# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
# Path to your oh-my-zsh installation. 
export ZSH="/home/$USERNAME/.oh-my-zsh" 
export KEYTIMEOUT=1
export WORKON_HOME="~/Codes/.env"

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
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u2425 "
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND="008"
POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND="white"
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND="white"
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND="black"
# POWERLEVEL9K_HOST_BACKGROUND="none"
# POWERLEVEL9K_HOST_FOREGROUND="yellow"
POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="none"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="magenta"
POWERLEVEL9K_DIR_HOME_BACKGROUND="none"
POWERLEVEL9K_DIR_HOME_FOREGROUND="magenta"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="none"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="magenta"
POWERLEVEL9K_DIR_ETC_BACKGROUND="none"
POWERLEVEL9K_DIR_ETC_FOREGROUND="magenta"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_OK_BACKGROUND="green"
POWERLEVEL9K_STATUS_OK_FOREGROUND="black"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="red"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="black"
POWERLEVEL9K_VCS_CLEAN_FOREGROUND="black"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="cyan"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="black"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="yellow"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="black"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="red"
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
  # host
  dir
  status
)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  vcs
  virtualenv
  time
)
# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see "man strftime" for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  django
  sudo
  web-search
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh
# User configuration
source /usr/local/bin/virtualenvwrapper.sh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR="vim"
# else
#   export EDITOR="mvim"
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias zource="source ~/.zshrc"
alias zp="code ~/.zshrc"
alias pp="code ~/.psqlrc"
alias sp="code ~/.ssh/config"
alias omp="code ~/.oh-my-zsh"
alias k="clear"
alias python="python3"
alias pip="pip3"
alias mkve="mkvirtualenv"
alias rmve="rmvirtualenv"
alias django="python manage.py"

bindkey -v
bindkey "^R" history-incremental-search-backward

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
    echo "in elif"
    deactivate && unset CD_VIRTUAL_ENV
  fi
}

function cd {
  builtin cd "$@" && check_for_virtual_env
}

check_for_virtual_env