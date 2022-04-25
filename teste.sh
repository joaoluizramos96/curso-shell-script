#!/usr/bin/env bash

comeca=0 ate=100

[ $comeca -ge $ate ] && exit 1

for i in $(seq $comeca $ate)

  do

    for j in $(seq $i $ate)

      do

        printf "*"

      done

    printf "\n"

  done
