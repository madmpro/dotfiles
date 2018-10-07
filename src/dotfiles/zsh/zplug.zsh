# zplug

export ZPLUG_HOME="$HOME/.zsh/zplug"
export ZPLUG_LOADFILE="$HOME/.zsh/packages.zsh"

# Install zplug if it's doesn't exist
if [ ! -d $ZPLUG_HOME ]; then
  git clone https://github.com/zplug/zplug.git $ZPLUG_HOME
fi

#source ~/.zplug/init.zsh
[ -f "$ZPLUG_HOME/init.zsh" ] && . "$ZPLUG_HOME/init.zsh"

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
