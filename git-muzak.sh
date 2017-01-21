#!/bin/bash
set -e

show_help() {
cat << EOF
Add the currently playing iTunes track to your git commits.

Usage:
    ${0##*/} <COMMIT_MSG_FILE> <SRC_TYPE> [<HASH>] # called via hook
    ${0##*/} [--install, --remove]

Options:
    -h, --help   Display this help and exit
    --install    Install hook to current git repository and exit

(To remove from a repo later, delete .git/hooks/prepare_commit_msg)
EOF
}

# git_dir for current directory
git_dir() {
    git rev-parse --git-dir
}

# absolute path for the bash source (e.g. this file)
bash_abs_src() {
    echo "$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)/$(basename "${BASH_SOURCE[0]}")"
}

# ACTION: symlink this script as the prepare-commit-msg hook for current git repo
install_hook() {
    local src
    local dst
    src="$(cd "$(dirname "${BASH_SOURCE[0]}")"; pwd)/$(basename "${BASH_SOURCE[0]}")"
    dst="$(git_dir)/hooks/prepare-commit-msg"
    ln -s "$src" "$dst"
    echo "√♬  Linked $dst to $src"
}

# ACTION: prepare commit message. this tiny part is the actual program!
prepare_commit_msg() {
    SONG=$(osascript -e 'tell application "iTunes" to if player state is playing then "♬ : " & artist of current track & " / " & name of current track')
    if [[ $SONG ]]; then
        echo -e "$(cat "$1")\n\n$SONG" > "$1"
    fi
}

case $1 in
    -h|--help|help|"")
        show_help
        exit 1
        ;;
    --install|install)
        install_hook
        exit
        ;;
    *)
        prepare_commit_msg "$@"
        exit
        ;;
esac
