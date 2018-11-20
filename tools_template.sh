#!/usr/bin/env bash

BIN_DIR=~/bin

MY_PATHS=(
	"${BIN_DIR}/diff-highlight"
)

NEW_PATH=$(join_array : "${MY_PATHS[@]}"):$PATH
export PATH="${NEW_PATH}"
