ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zinit snippet OMZL::git.zsh
zinit snippet OMZL::directories.zsh

zinit snippet OMZP::git
zinit snippet OMZP::brew

# Load order matters: autosuggestions and fzf-tab before syntax-highlighting,
# since zsh-syntax-highlighting must be loaded last to wrap all widgets correctly.
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-syntax-highlighting

autoload -Uz compinit
compinit

alias cat="bat"
alias ls="eza -la --group-directories-first --icons --git"

export BAT_THEME="Visual Studio Dark+"

# fnm
eval "$(fnm env --use-on-cd)"

# atuin
if command -v atuin >/dev/null 2>&1; then
  eval "$(atuin init zsh)"
fi
