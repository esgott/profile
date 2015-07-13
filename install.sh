#!/bin/bash

REPO_DIR="$(dirname "${0}")"
REPO_DIR_ABSOLUTE="$(readlink -f "${REPO_DIR}")"

function install_file {
    local source="${1}"
    local destination="${2}"

    if [ ! -e "${destination}" ]; then
    	ln -s "${source}" "${destination}"
    else
    	>&2 echo "Failed to install ${source} to ${destination}, destination exists"
    fi
}

install_file "${REPO_DIR_ABSOLUTE}/bashrc" "${HOME}/.bashrc"
install_file "${REPO_DIR_ABSOLUTE}/zshrc"  "${HOME}/.zshrc"
install_file "${REPO_DIR_ABSOLUTE}/vimrc"  "${HOME}/.vimrc"
install_file "${REPO_DIR_ABSOLUTE}/vim"    "${HOME}/.vim"

git config --global include.path "${REPO_DIR_ABSOLUTE}/gitconfig"
