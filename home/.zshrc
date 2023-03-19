# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZPLUG_HOME=~/.zplug

if [ ! -d "$ZPLUG_HOME" ]; then
  git clone https://github.com/zplug/zplug.git "$ZPLUG_HOME"
fi

source ~/.zplug/init.zsh

zplug romkatv/powerlevel10k, as:theme, depth:1
zplug zsh-users/zsh-syntax-highlighting, defer:2

zplug load

fzf-z() {
  temp="$(mktemp --suffix=fzf-z)"
  jobs -l > "$temp"
  list="$(< "$temp")"
  rm "$temp"
  pid="$(printf %s "$list" \
    | fzf -0 -1 \
    | tr -d '[]')"

  if [ -z "$pid" ]; then
    return
  fi

  %"$pid"
}

zle -N fzf-z

bindkey '^Z' fzf-z

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
