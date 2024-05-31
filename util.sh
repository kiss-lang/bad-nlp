# prompt_char "prompt" <?timeout_sec>
# Set REPLY to the next char the user types:
prompt_char () {
    exec < /dev/tty
    if [ ! -z "$2" ]; then
        read -t $2 -p "${1} " -n 1 -r
    else
        read -p "${1} " -n 1 -r
    fi
    if [ $? -ne 0 ]; then
        REPLY=n
    fi
    echo    # (optional) move to a new line
    exec <&-
}