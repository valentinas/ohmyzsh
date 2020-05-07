function _virtualenv_prompt_info {
    if [[ -n "$(whence virtualenv_prompt_info)" ]]; then
        if [ -n "$(whence pyenv_prompt_info)" ]; then
            if [ "$1" = "inline" ]; then
                ZSH_THEME_VIRTUAL_ENV_PROMPT_PREFIX=%{$fg[blue]%}"::%{$fg[red]%}"
                ZSH_THEME_VIRTUAL_ENV_PROMPT_SUFFIX=""
                virtualenv_prompt_info
            fi
            [ "$(pyenv_prompt_info)" = "${PYENV_PROMPT_DEFAULT_VERSION}" ] && virtualenv_prompt_info
        else
            virtualenv_prompt_info
        fi
    fi
}

PROMPT=$'
%{$fg_bold[green]%}%n@%m %{$fg[blue]%}%D{[%H:%M:%S]} %{$reset_color%}%{$fg[white]%}[%~]%{$reset_color%} $(git_prompt_info)\
%{$fg[blue]%}->%{$fg_bold[blue]%}$(_virtualenv_prompt_info) %#%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}*%{$fg[green]%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
