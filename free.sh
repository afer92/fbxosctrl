#!/usr/bin/env bash

. ~/.venv/freebox/bin/activate

FBX=$( dirname $0 )/fbxosctrl.py

die() { echo "$0: die - $*" >&2; exit 1; }

[ $# -eq 0 ] && set -- --help

while [ $# -ne 0 ]; do
    case $1 in
            -reg*) $FBX -regapp; exit $?;;
       -lp|--pfwd) $FBX --pfwd; exit $?;;
        -h|--help) $FBX --help; exit $?;;
        --ip*) $FBX --dhcpleases | grep -E "^([0-9]|List of)"; exit $?;;

              --*) $FBX $*; exit $?;;

                *) die "Unknown option '$1'";;
    esac
    shift
done


