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

    if [ -e "${destination}" ]; then
        mv "${destination}" "${destination}.backup"
    fi
    ln -s "${source}" "${destination}"
    echo "${destination} installed"
}

function download_file {
    local source="${1}"
    local destination="${2}"
    echo "Downloading file from ${source} to ${destination}"
    wget "${source}" "${destination}"
}

echo "-- Installing configuration files"
install_file "${REPO_DIR_ABSOLUTE}/bashrc" "${HOME}/.bashrc"
install_file "${REPO_DIR_ABSOLUTE}/zshrc"  "${HOME}/.zshrc"
install_file "${REPO_DIR_ABSOLUTE}/vimrc"  "${HOME}/.vimrc"
install_file "${REPO_DIR_ABSOLUTE}/vim"    "${HOME}/.vim"

git config --global include.path "${REPO_DIR_ABSOLUTE}/gitconfig"
echo "gitconfig included"

echo " -- Installing vim packages "
if [ -d "${VUNDLE_REPO}" ]; then
    pushd "${VUNDLE_REPO}" > /dev/null
    git pull
    popd > /dev/null
else
    mkdir -p "${VUNDLE_REPO}"
    git clone https://github.com/gmarik/Vundle.vim.git "${VUNDLE_REPO}"
fi
vim +PluginInstall +qall
echo "Vim plugins installed"

echo "-- Install diff-highlight for Git"
DIFF_HIGHLIGHT_DIR="${BIN_DIR}/diff-highlight"
DIFF_HIGHLIGHT_EXE="${DIFF_HIGHLIGHT_DIR}/diff-highlight"
if [[ "$(uname)" == "Darwin" ]]; then
    DIFF_HIGHLIGHT="/usr/local/share/git-core/contrib/diff-highlight/diff-highlight"
else
    DIFF_HIGHLIGHT="/usr/share/doc/git/contrib/diff-highlight/diff-highlight"
fi
mkdir -p "${DIFF_HIGHLIGHT_DIR}"
echo "bin directory created"
install_file "${DIFF_HIGHLIGHT}" "${DIFF_HIGHLIGHT_EXE}"
echo "diff-highlight configured"

echo "-- Configuring SBT"
SBT_VERSIONS=(0.13 1.0)
for sbt_version in "${SBT_VERSIONS[@]}"; do
    sbt_dir="${HOME}/.sbt/${sbt_version}"
    mkdir -p "${sbt_dir}/plugins"
    for file in "${REPO_DIR_ABSOLUTE}/sbt"/*.sbt; do
        install_file "${file}" "${sbt_dir}/$(basename -- "${file}")"
    done
    for file in "${REPO_DIR_ABSOLUTE}/sbt/plugins"/*.sbt; do
        install_file "${file}" "${sbt_dir}/plugins/$(basename -- "${file}")"
    done
done

echo "-- Installing Oh My Zsh"
git clone "git@github.com:robbyrussell/oh-my-zsh.git" "${HOME}/.oh-my-zsh"

echo "-- Installing dircolors-solarized"
DIRCOLORS_DIR="${REPO_DIR}/../dircolors-solarized"
git clone "git@github.com:seebi/dircolors-solarized.git" "${DIRCOLORS_DIR}"
install_file "${DIRCOLORS_DIR}/dircolors.256dark" "${HOME}/.dircolors"

