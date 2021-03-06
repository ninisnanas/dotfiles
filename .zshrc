# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export GOPRIVATE=source.golabs.io,gitlab.com
export PATH=$PATH:$GOPATH/bin:/usr/local/bin/idea
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_241.jdk/Contents/Home
export PATH=$PATH:~/.rbenv/shims
export PATH=$PATH:/Users/mapan/go/src/github.com/grpc/cmake/build

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"
DEFAULT_USER=$USER
POWERLEVEL9K_MODE="nerdfont-complete"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs newline status)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(root_indicator background_jobs time)
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_DIR_HOME_BACKGROUND="navy"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="navy"
POWERLEVEL9K_DIR_ETC_BACKGROUND="navy"
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND="navy"
POWERLEVEL9K_TIME_BACKGROUND="navy"

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
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  bundler
  docker
  git
  golang
  osx
  rbenv
  vscode
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR="vim"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

unset LSCOLORS
export CLICOLOR=1
export CLICOLOR_FORCE=1

export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
export LC_ALL=en_US.UTF-8

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/mapan/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/mapan/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/mapan/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/mapan/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

eval "$(rbenv init -)"

connect-vpn () {
   execute_script="$HOME/.scripts/gojek-vpn.sh"
   if [ $# -lt 1 ]; then
     echo "Usage: $0 [VPN indexes]"
     echo "Eg. $0 0 1 2"
     echo "\n"
     bash ${execute_script} | sed -n -e '/List/,$p'
   else
     bash ${execute_script} $@ "$(oathtool --totp -b pcbpvo3c6yogyau4p5fkwmvqmit3wfzm)"
   fi
 }

alias pull_all="find . -type d -depth 1 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin master \;"
