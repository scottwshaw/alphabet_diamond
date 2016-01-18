#! /bin/bash
set -e

hash julia 2>/dev/null || { \
    echo >&2 "Command \"julia\" can't be found.";
    echo >&2 "Perhaps you need to install the Julia language.";
    echo >&2 "try executing \"brew cask install julia\"";
    echo >&2 "Aborting."; exit 1; }

julia diamond.jl $1
