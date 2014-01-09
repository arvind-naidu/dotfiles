#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

for config_file ($HOME/.yadr/zsh/*.zsh) source $config_file

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

alias tmux="TERM=screen-256color-bce tmux"

# Install a grunt plugin and save to devDependencies
function int() {
  npm install --save-dev grunt-"$@"
}

# Install a grunt-contrib plugin and save to devDependencies
function intci() {
  npm install --save-dev grunt-contrib-"$@"
}
