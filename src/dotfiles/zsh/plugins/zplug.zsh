# zplug

# zplug options
export ZPLUG_THREADS=4              # multithreaded download / update
export ZPLUG_HOME="$HOME/.zsh/plugins/zplug"
export ZPLUG_LOADFILE="$HOME/.zsh/plugins/packages.zsh"

# ─── ZPLUG INITIALIZATION ───────────────────────────────────────────────────────

# Install zplug if it's doesn't exist
if [ ! -d $ZPLUG_HOME ]; then
  if (( $+commands[git] )); then
    git clone https://github.com/zplug/zplug.git $ZPLUG_HOME
  else
      echo 'git not found!' >&2
      exit 1
  fi
fi

#source ~/.zplug/init.zsh
[ -f "$ZPLUG_HOME/init.zsh" ] && . "$ZPLUG_HOME/init.zsh"

# Install plugins if there are plugins that have not been installed
if ! zplug check; then
    printf "Install ZSH plugins? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
