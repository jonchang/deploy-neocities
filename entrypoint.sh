#!/bin/sh -l

set -e

if [ "$#" -ne 3 ]; then
  echo "Usage: API_KEY DIRECTORY CLEANUP" >&2
  exit 1
fi

if ! [ -d "$2" ]; then
  echo "$2 not found" >&2
  exit 1
fi

export NEOCITIES_API_KEY="$1"
export PATH=/usr/local/bundle/bin:$PATH

cd "$2"

neocities push .

if [ "$3" = "true" ]; then
    comm -2 -3 <(TERM=dumb neocities list -a | sort) <(find . | cut -c3- | sort) > /tmp/remove.txt
    [ -s /tmp/remove.txt ] && cat /tmp/remove.txt | xargs neocities delete
fi
