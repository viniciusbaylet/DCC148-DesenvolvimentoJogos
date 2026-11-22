#!/bin/sh
printf '\033c\033]0;%s\a' Trabalho2
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Trabalho2.x86_64" "$@"
