#! /bin/bash

function usage
{
    echo "Usage: grafana-tools <backup|import> <grafana-url> <api-token>"
    exit 5
}

function runAction
{
    mkdir /grafana-data/$4 || true
    pushd /grafana-data/$4
    /$1-$4 $2 $3
    popd
}

# expected arguments:
# $1: backup|import
# $2: grafana-url
# $3: api-token
case "$1" in
    backup) ;;
    restore) ;;
    *) usage
esac
if [ -z "$2" ]; then usage; fi
if [ -z "$3" ]; then usage; fi

runAction $1 $2 $3 "datasources"
runAction $1 $2 $3 "dashboards"
