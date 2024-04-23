# af-magic.zsh-theme
#
# Author: Andy Fleming
# URL: http://andyfleming.com/

# dashed separator size
function afmagic_dashes {
  # check either virtualenv or condaenv variables
  local python_env_dir="${VIRTUAL_ENV:-$CONDA_DEFAULT_ENV}"
  local python_env="${python_env_dir##*/}"

  # if there is a python virtual environment and it is displayed in
  # the prompt, account for it when returning the number of dashes
  if [[ -n "$python_env" && "$PS1" = *\(${python_env}\)* ]]; then
    echo $(( COLUMNS - ${#python_env} - 3 ))
  else
    echo $COLUMNS
  fi
}

# _ARCH=$(arch)

# primary prompt: dashed separator, directory and vcs info
PS1="%F{#89c0d0}%(!.#.)%{$reset_color%}%F{#c099ff}%(!.#.)%{$reset_color%}%F{#0db9d7}%(!.#.)%{$reset_color%} "
PS2="%{$fg[red]%}\ %{$reset_color%}"

# right prompt: return code, virtualenv and context (user@host)
# _ARCH=$(arch)
RPS1="%(?..%{$fg[red]%}%? ↵%{$reset_color%}) "
if (( $+functions[virtualenv_prompt_info] )); then
  RPS1+='$(virtualenv_prompt_info)'
fi
RPS1+="%F{#89c0d0}[%~]\$(git_prompt_info)%F{#89c0d0} [%D{%d/%m/%Y} %T]%{$reset_color%}"

# git settings
ZSH_THEME_GIT_PROMPT_PREFIX=" %F{#89c0d0}["
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_DIRTY="%F{#EBCB8B}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{#89c0d0}]%{$reset_color%}"

# hg settings
ZSH_THEME_HG_PROMPT_PREFIX=" ${FG[075]}(${FG[078]}"
ZSH_THEME_HG_PROMPT_CLEAN=""
ZSH_THEME_HG_PROMPT_DIRTY="${FG[214]}*%{$reset_color%}"
ZSH_THEME_HG_PROMPT_SUFFIX="${FG[075]})%{$reset_color%}"

# virtualenv settings
ZSH_THEME_VIRTUALENV_PREFIX=" ${FG[075]}["
ZSH_THEME_VIRTUALENV_SUFFIX="]%{$reset_color%}"

# See https://geoff.greer.fm/lscolors/
export LSCOLORS="gxfxcxdxdxbxbxbxbxgxgx"
export LS_COLORS="di=36:ln=35:so=32:pi=33:ex=33:bd=31:cd=31:su=31:sg=31:tw=36:ow=36"
