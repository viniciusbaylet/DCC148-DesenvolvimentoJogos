#!/bin/sh
printf '\033c\033]0;%s\a' Trabalho1
base_path="$(dirname "$(realpath "$0")")"
"$base_path/MarbleMadness.x86_64" "$@"
