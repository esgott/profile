#!/usr/bin/env bash

set -eu

brew tap caskroom/fonts

brew install \
	bash \
	colordiff \
	coreutils \
	findutils \
	gawk \
	git \
	gnu-getopt
	gnu-indent \
	gnu-tar \
	gnu-sed \
	gnutls \
	sbt \
	scala \
	shellcheck \
	vim \
	zsh \
	zsh-completions \
	zsh-syntax-highlighting

brew install --cask \
	font-fira-code \
	font-fira-mono \
	font-fira-mono-for-powerline \
	font-fira-sans \
	java
