#!/bin/sh -l

set -eux

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
  TERM=dumb neocities list -a | sort > /tmp/theirs.txt
  find . | cut -c3- | sort > /tmp/ours.txt
  comm -2 -3 /tmp/theirs.txt /tmp/ours.txt > /tmp/remove.txt
  if [ -s /tmp/remove.txt ]; then
    cat /tmp/remove.txt | xargs neocities delete
  fi
fi
