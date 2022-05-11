# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/sbin:/usr/local/bin:/Applications/Postgres.app/Contents/Versions/10/bin:$PATH
# Path to your oh-my-zsh installation. 
export ZSH="/Users/$USERNAME/.oh-my-zsh" 
export KEYTIMEOUT=1
export DEFAULT_USER=$USER
export GPG_TTY=$(tty)
gpgconf --launch gpg-agent

# add nvm to path
. ~/.nvm/nvm.sh

# Put this into your $HOME/.zshrc to call nvm use automatically whenever you enter a directory that contains an .nvmrc file with a string telling nvm which node to use:
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use --silent
  elif [[ -f package.json && -r package.json ]]; then
    nvm use --silent $(cat package.json | node -e "const{stdin}=require('process');stdin.setDefaultEncoding('utf8');let s='';stdin.on('data',d=>{s+=d.toString()});stdin.on('end',_=>{const j=JSON.parse(s);j.hasOwnProperty('engines')&&j.engines.hasOwnProperty('node')?console.log(j.engines.node):console.log('default')})")  
  elif [[ $(nvm version) != $(nvm version default) ]]; then
    nvm use --silent default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k" 
 
### POWERLEVEL SETTINGS
# Powerlevel9k settings
# POWERLEVEL9K_TRANSIENT_PROMPT=always
POWERLEVEL9K_LEGACY_ICON_SPACING=true
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

POWERLEVEL9K_CONTEXT_TEMPLATE="%B%F{grey}SSH:%b%f %U%F{blue}$USER%f%u%F{grey}@%B%F{cyan}${HOST%.*}%f%b"
POWERLEVEL9K_CONTEXT_REMOTE_BACKGROUND="none"
POWERLEVEL9K_CONTEXT_REMOTE_FOREGROUND="blue"

POWERLEVEL9K_DIR_SHOW_WRITABLE=true
POWERLEVEL9K_DIR_NOT_WRITABLE_BACKGROUND='none'
POWERLEVEL9K_DIR_NOT_WRITABLE_FOREGROUND='yellow'
POWERLEVEL9K_DIR_ETC_BACKGROUND="none"
POWERLEVEL9K_DIR_ETC_FOREGROUND="blue"
POWERLEVEL9K_DIR_HOME_BACKGROUND="none"
POWERLEVEL9K_DIR_HOME_FOREGROUND="grey"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="none"
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND="yellow"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="none"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="grey"

POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_STATUS_OK_BACKGROUND="none"
POWERLEVEL9K_STATUS_OK_FOREGROUND="green"
POWERLEVEL9K_STATUS_ERROR_BACKGROUND="none"
POWERLEVEL9K_STATUS_ERROR_FOREGROUND="red"

POWERLEVEL9K_NVM_BACKGROUND="none"
POWERLEVEL9K_NVM_FOREGROUND="green"

POWERLEVEL9K_VCS_CLEAN_FOREGROUND="grey"
POWERLEVEL9K_VCS_CLEAN_BACKGROUND="none"
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND="yellow"
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND="none"
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND="red"
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND="none"
POWERLEVEL9K_VCS_SHORTEN_LENGTH="20"
POWERLEVEL9K_VCS_SHORTEN_MIN_LENGTH="20"
POWERLEVEL9K_VCS_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_VCS_HIDE_TAGS="true"

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
  vi_mode
  status
  context
  dir
)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  vcs
  nvm
)

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  web-search
  zsh-syntax-highlighting
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh
# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR="vi"
else
  export EDITOR="code"
fi


# ssh
export SSH_KEY_PATH="~/.ssh/ecdsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

### ALIAS ###
alias zource='source ~/.zshrc'
alias zp='$EDITOR ~/.zshrc'
alias vp='$EDITOR ~/.vimrc'
alias pp='$EDITOR ~/.psqlrc'
alias sp='$EDITOR ~/.ssh/config'
alias omp='$EDITOR ~/.oh-my-zsh'
alias k='clear'
alias gcx:update-all='(git:update ~/Developer/web.host) & (git:update ~/Developer/api.core) & (git:update ~/Developer/api.graphql-gateway) & (git:update ~/Developer/api.calendar-events) & wait'
alias s='sudo'
alias xclt='sudo rm -rf $(xcode-select -p) && sudo rm -rf /Library/Developer/CommandLineTools && xcode-select --install'
alias core='cd ~/Codes/gcx-core && docker-sync-stack start'
alias tf='terraform'
alias proxy:up='(cd ~/Developer/dx.utilities/apps/proxy;npm start)'
alias proxy:down='(cd ~/Developer/dx.utilities/apps/proxy;npm run stop)'
alias proxy:bounce='(cd ~/developer/dx.utilities/apps/proxy;npm run stop && npm start)'

bindkey -v
bindkey "^R" history-incremental-search-backward
unsetopt prompt_cr prompt_sp

function git:update {
  cd $1
  CURRENT_BRANCH=$(git --no-pager branch | grep '*' | awk '{print $2}')

  git stash && git switch master && git pull && git switch $CURRENT_BRANCH
}

function rake:staging {
  ssh -t staging ./bin/rake $@
}

function rake:dev {
  ssh -t dev ./bin/rake $@
}

function rake:qa {
  ssh -t qa ./bin/rake $@
}

function rake:prod {
  ssh -t prod ./bin/rake $@
}

function docker:clear {
  docker ps -aq | \
    while read id; do docker stop $id && docker rm $id; done
}

# function hack {
#   $EDITOR $(ls "$1/**/*" | fzf)
# }

function docker:nuke {
  docker:clear && \
  docker image ls | \
    tr -s ' ' | \
    awk '{print $3}' | \
    while read id; do docker image rm $id --force; done
}

function = {
  local IFS=" "
  local calc="${*//p/+}"
  calc="${calc//x/*}"
  echo "$(($calc))"
}
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(rbenv init -)"

# # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
