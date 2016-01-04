#!/usr/bin/env bash

BIN_DIR=~/bin

MY_PATHS=(
	"${BIN_DIR}/diff-highlight"
)

export PATH=$(join_array : "${MY_PATHS[@]}"):$PATH
