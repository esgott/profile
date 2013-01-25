#!/bin/bash

set -e

WORKING_DIR=`pwd`

function createLink {
	if [ -f $2 ]; then
		mv $2 ${2}.original
	fi
	ln -s $WORKING_DIR/$1 $2
}

createLink bash_aliases ~/.bash_aliases
createLink bashrc ~/.bashrc
createLink gitconfig ~/.gitconfig
