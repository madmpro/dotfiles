#!/usr/bin/env zsh
# zplug

# Make sure to use double quotes

# Use the package as a command
# And accept glob patterns (e.g., brace, wildcard, ...)
#zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

# Can manage everything e.g., other person's zshrc
alias name="#statement"

# check if oh-my-zsh installed
if [[ ! -d "$HOME/.zsh/zplug/repos/robbyrussell/oh-my-zsh" ]]; then
  git clone https://github.com/robbyrussell/oh-my-zsh "$HOME/.zsh/zplug/repos/robbyrussell/oh-my-zsh"
fi

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/autojump", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh, defer:3
zplug "plugins/thefuck", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh
zplug "plugins/golang", from:oh-my-zsh
zplug "plugins/yarn", from:oh-my-zsh, defer:3
zplug "plugins/git", from:oh-my-zsh, defer:3

# Disable updates using the "frozen" tag
#zplug "k4rthik/git-cal", as:command, frozen:1

# Also prezto
# zplug "modules/prompt", from:prezto

# Run a command after a plugin is installed/updated
# Provided, it requires to set the variable like the following:
# ZPLUG_SUDO_PASSWORD="********"
#zplug "jhawthorn/fzy", \
#    as:command, \
#    rename-to:fzy, \
#    hook-build:"make && sudo make install"

# Supports checking out a specific branch/tag/commit
#zplug "b4b4r07/enhancd", at:v1
#zplug "mollifier/anyframe", at:4c23cb60

# Can manage gist file just like other packages
#zplug "b4b4r07/79ee61f7c140c63d2786", \
#    from:gist, \
#    as:command, \
#    use:get_last_pane_path.sh

# Support bitbucket
#zplug "b4b4r07/hello_bitbucket", \
#    from:bitbucket, \
#    as:command, \
#    use:"*.sh"

# Rename a command with the string captured with `use` tag
#zplug "b4b4r07/httpstat", \
#    as:command, \
#    use:'(*).sh', \
#    rename-to:'$1'

# Group dependencies
# Load "emoji-cli" if "jq" is installed in this example
#zplug "stedolan/jq", \
#    from:gh-r, \
#    as:command, \
#    rename-to:jq
#zplug "b4b4r07/emoji-cli", \
#    on:"stedolan/jq"
# Note: To specify the order in which packages should be loaded, use the defer
#       tag described in the next section

# Can manage local plugins
#zplug "~/.zsh/plugins", from:local

# Load theme file
#zplug 'dracula/zsh', as:theme

#zplug "felixr/docker-zsh-completion", defer:3

# Load if "if" tag returns true
#zplug "lib/clipboard", from:oh-my-zsh, if:"[[ $OSTYPE == *darwin* ]]"
#zplug "djui/alias-tips"
#zplug "lib/directories", from:oh-my-zsh
#zplug "lib/history", from:oh-my-zsh, defer:3
#zplug "lib/key-bindings", from:oh-my-zsh
#zplug "lib/theme-and-appearance", from:oh-my-zsh

#zplug "sindresorhus/pure", use:pure.zsh, as:theme
#zplug "zplug/zplug", hook-build:'zplug --self-manage'
#zplug "zsh-users/zsh-autosuggestions"
#zplug "zsh-users/zsh-completions", defer:2
# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
#zplug "zsh-users/zsh-syntax-highlighting", defer:2 # Should be loaded 2nd last.
#zplug "zsh-users/zsh-history-substring-search", defer:3 # Should be loaded last.
#zplug "mafredri/zsh-async", defer:0,  ignore:"*test.zsh"

#zplug "junegunn/fzf", use:"shell/*.zsh", as:plugin, defer:3
# Grab binaries from GitHub Releases
# and rename with the "rename-to:" tag
#zplug "junegunn/fzf-bin", \
#    from:gh-r, \
#    as:command, \
#    rename-to:fzf, \
#    use:"*darwin*amd64*"
