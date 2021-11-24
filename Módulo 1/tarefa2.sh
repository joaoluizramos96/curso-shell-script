#!/usr/bin/env bash

for (( i = 1; i < 11; i++ )); do
  if [[ i%2 -eq 0 ]]; then
    echo "$i - Número divisível por 2."
  fi
done
