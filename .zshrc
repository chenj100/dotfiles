# -----------------------------
# Editor / Pager
# -----------------------------
export EDITOR="vim"
export VISUAL="vim"
export PAGER="less"
export LESS="-R"

# -----------------------------
# History
# -----------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_SAVE_NO_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# -----------------------------
# Completion
# -----------------------------
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
if [[ -n "$LS_COLORS" ]]; then
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
fi

# -----------------------------
# Prompt with vcs_info
# -----------------------------
autoload -Uz colors && colors
autoload -Uz vcs_info

# Enable git support
zstyle ':vcs_info:*' enable git

# Format when inside a git repo
zstyle ':vcs_info:git:*' formats ' %F{yellow}(%b)%f'

# Format during actions like rebase, merge, cherry-pick
zstyle ':vcs_info:git:*' actionformats ' %F{yellow}(%b|%a)%f'

# Optional: show staged/unstaged markers
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '!'
zstyle ':vcs_info:git:*' formats ' %F{yellow}(%b%c%u)%f'
zstyle ':vcs_info:git:*' actionformats ' %F{yellow}(%b|%a%c%u)%f'

precmd() {
  vcs_info
}

setopt PROMPT_SUBST

PROMPT='%F{cyan}%~%f${vcs_info_msg_0_} %# '

# -----------------------------
# Word navigation
# -----------------------------
# Option + Left/Right: jump backward/forward by word
# Option + Backspace: delete backward by word
# Option + Delete: delete forward by word
bindkey "^[[1;3D" backward-word
bindkey "^[[1;3C" forward-word
bindkey "^[[3;3~" kill-word

# -----------------------------
# Aliases
# -----------------------------
alias ll="ls -lh"

# -----------------------------
# fzf
# -----------------------------
source <(fzf --zsh)
