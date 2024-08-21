#!/usr/bin/env bash

DB=fbxosctrl.db

[ ! -z "$1" ] && { DB=$1; shift; }

echo "Port forwardings in $DB:"
echo 'select * from fw_redir' | sqlite3 $DB
