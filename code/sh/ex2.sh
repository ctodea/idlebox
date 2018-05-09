#!/bin/bash

x=()

for i in "$@"; do
  if ( echo "$i" | grep -qE "^\-?[0-9]*$" ); then
    x+=("$i")
  fi
done

for i in "${x[@]}"; do
  [ "$i" -gt 0 ] && echo "Talent" || echo "Werk"
done  

