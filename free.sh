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

               # HACK: manually delete WHOLE db
               -P) rm fbxosctrl.db;
                   YAML=ports.yaml
                   [ ! -z "$2" ] && { shift; YAML=$1; }
                   set -x
                   $FBX --load-yaml $YAML --save
                   set +x
                   ls -altr *.db
                   ;;
               -D) rm fbxosctrl.db;
                   $FBX --save --delete-all-pfwds;
                   ls -altr *.db
                   ;;

              --*) $FBX $*; exit $?;;

                *) die "Unknown option '$1'";;
    esac
    shift
done


