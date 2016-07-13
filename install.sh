#!/usr/bin/env bash

set -eu

READLINK=readlink
if [[ "$(uname)" == "Darwin" ]]; then
    READLINK=greadlink
fi

REPO_DIR="$(dirname "${0}")"
REPO_DIR_ABSOLUTE="$(${READLINK} -f "${REPO_DIR}")"
VUNDLE_REPO="${HOME}/.vim/bundle/Vundle.vim"
BIN_DIR="${HOME}/bin"

function install_file {
    local source="${1}"
    local destination="${2}"

    if [ ! -e "${destination}" ]; then
        ln -s "${source}" "${destination}"
        echo "${destination} installed"
    else
        >&2 echo "Failed to install ${source} to ${destination}, destination exists"
    fi
}

function download_file {
    local source="${1}"
    local destination="${2}"
    wget "${source}" "${destination}"
}

install_file "${REPO_DIR_ABSOLUTE}/bashrc" "${HOME}/.bashrc"
install_file "${REPO_DIR_ABSOLUTE}/zshrc"  "${HOME}/.zshrc"
install_file "${REPO_DIR_ABSOLUTE}/vimrc"  "${HOME}/.vimrc"
install_file "${REPO_DIR_ABSOLUTE}/vim"    "${HOME}/.vim"

git config --global include.path "${REPO_DIR_ABSOLUTE}/gitconfig"
echo "gitconfig included"

if [ -d "${VUNDLE_REPO}" ]; then
    pushd "${VUNDLE_REPO}" > /dev/null
    git pull
    popd > /dev/null
else
    mkdir -p "${VUNDLE_REPO}"
    git clone https://github.com/gmarik/Vundle.vim.git "${VUNDLE_REPO}"
fi
vim +PluginInstall +qall
echo "vim plugins installed"

DIFF_HIGHLIGHT_DIR="${BIN_DIR}/diff-highlight"
DIFF_HIGHLIGHT_EXE="${DIFF_HIGHLIGHT_DIR}/diff-highlight"
mkdir -p "${DIFF_HIGHLIGHT_DIR}"
echo "bin directory created"
download_file "https://raw.githubusercontent.com/git/git/master/contrib/diff-highlight/diff-highlight" "${DIFF_HIGHLIGHT_EXE}"
chmod -x "${DIFF_HIGHLIGHT_EXE}"
echo "diff-highlight downloaded"

