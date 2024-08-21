#!/usr/bin/env bash

. ~/.venv/freebox/bin/activate

FBX=$( dirname $0 )/fbxosctrl.py

die() { echo "$0: die - $*" >&2; exit 1; }

while [ $# -ne 0 ]; do
    case $1 in
            -reg*) $FBX -regapp;;
       -lp|--pfwd) $FBX --pfwd;;
        -h|--help) $FBX --help;;

                *) die "Unknown option '$1'";;
    esac
    shift
done


