# create a new directory and enter it
function mkcd() {
    mkdir -p "$@" && cd "$@"
}
