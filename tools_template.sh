#!/usr/bin/env bash

BIN_DIR=~/bin

MY_PATHS=(
)

export PATH=$(join_array : "${MY_PATHS[@]}"):$PATH
