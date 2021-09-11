#!/usr/bin/bash
#
#  ██████╗  █████╗ ██╗  ██╗██████╗    ███╗   ██╗███████╗████████╗
# ██╔════╝ ██╔══██╗██║  ██║██╔══██╗   ████╗  ██║██╔════╝╚══██╔══╝
# ██║  ███╗███████║███████║██║  ██║   ██╔██╗ ██║█████╗     ██║
# ██║   ██║██╔══██║██╔══██║██║  ██║   ██║╚██╗██║██╔══╝     ██║
# ╚██████╔╝██║  ██║██║  ██║██████╔╝██╗██║ ╚████║███████╗   ██║
#  ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝
#   ____  ___  _   _ ____
#  / ___|/ _ \| | | |  _ \   minions/bash/disco.sh
# | |  _| |_| | |_| | | | |
# | |_| |  _  |  _  | |_| |  Gustavo Huarcaya
#  \____|_| |_|_| |_|____/   https://gahd.net
#
# Shows the size used by subdirectories.
#

MY_DIR=$HOME

function show_size {
    SAVEIFS=$IFS
    IFS=$(echo -en "\n\b")
    for dir in $(ls -d $MY_DIR/*/)
    do
	echo "$(du -sh $dir)"
    done
    IFS=$SAVEIFS
}

if [[ $# -eq 1 ]]
then
    if [[ -d $1  ]]; then
	MY_DIR=$1
	show_size
    elif [[ -e $1 ]]; then
	echo "$(du -sh $1)"
    else
	echo "$1 does not exist"
    fi
else
    show_size
fi
