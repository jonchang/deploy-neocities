#!/bin/sh -l

set -e

export NEOCITIES_API_KEY="$1"

cd "$2"

neocities push .

if [ "$3" = "true" ]; then
    comm -2 -3 <(TERM=dumb neocities list -a | sort) <(find . | cut -c3- | sort) | xargs neocities delete
fi
