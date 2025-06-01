#!/bin/zsh
for f in "$@"; do
   echo "<--- $(basename "$f") --->"
   cat "$f"
done
