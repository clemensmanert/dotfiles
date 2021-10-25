# Install fundle if not there
if not functions -q fundle; eval (curl -sfL https://git.io/fundle-install); end

fundle plugin 'danhper/fish-ssh-agent'
fundle init

set PATH ~/projekte/dotfiles/scripts $PATH
set PATH ~/projekte/dotfiles/links $PATH
set PATH ~/.local/bin $PATH

# Ruby version manager
if [ -d ~/.rvm/bin ]
   set PATH ~/.rvm/bin $PATH
end

# Powerline: Needs to have: pip install powerline-status
set fish_function_path $fish_function_path "/usr/share/powerline/bindings/fish"
powerline-setup

set EDITOR "emacsclient --no-wait"

alias t trash

