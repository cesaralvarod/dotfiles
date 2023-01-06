set -g -x fish_greeting ''

#  Android Studio and Android SDK

set -g -x ANDROID_HOME $HOME/Android/Sdk

set -U fish_user_paths $ANDROID_HOME/emulator $fish_user_paths
set -U fish_user_paths $ANDROID_HOME/tools $fish_user_paths
set -U fish_user_paths $ANDROID_HOME/tools-bin $fish_user_paths
set -U fish_user_paths $ANDROID_HOME/platform-tools $fish_user_paths

# Anaconda

# !! Contents within this block are managed by 'conda init' !!
# eval /home/andres/anaconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# Starship

starship init fish | source

alias unset 'set --erase'

set --erase ANDROID_SDK_ROOT
