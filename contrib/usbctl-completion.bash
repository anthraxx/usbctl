_usbctl_completions() {
    if [ "${#COMP_WORDS[@]}" != "2" ]; then
        return
    fi

    COMPREPLY=($(compgen -W "protect unprotect enable disable on off temporary check status ls" "${COMP_WORDS[1]}"))
}
complete -F _usbctl_completions usbctl
