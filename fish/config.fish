# ssh-agent stuff
set -x SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"
fundle plugin 'tuvistavie/fish-ssh-agent'

set PATH ~/projekte/dotfiles/scripts $PATH
set PATH ~/projekte/dotfiles/links $PATH

# Powerline: Needs to have: pip install powerline-status
set fish_function_path $fish_function_path "/usr/lib/python3.7/site-packages/powerline/bindings/fish"
powerline-setup

set EDITOR "emacsclient --no-wait"

