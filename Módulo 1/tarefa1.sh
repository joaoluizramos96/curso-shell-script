##!/usr/bin/env bash

#1. VALIDAÇÃO DE NÚMEROS:
echo "Parêmetro a ser comparado: $1"

[ $1 -gt 10 ] && echo "
Nome do script: $0
PID: $$"
