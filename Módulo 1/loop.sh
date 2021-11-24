#!/usr/bin/env bash

#UTILIZANDO A FORMA PADRÃO DO FOR:
echo "======FOR 1"
for (( i = 0; i < 10; i++ )); do
  echo $i
done

#UTILIZANDO SEQ:
#O DO PODE SER "QUEBRADO" DA MESMA FORMA QUE O THEN É "QUEBRADO" NO IF.
echo "======FOR 2 (seq)"
for i in $(seq 10); do
  echo $i
done

#UTILIZANDO ARRAYS:
#NESSA SITUAÇÃO, O FOR VAI UTILIZAR COMO MODELO DE COMPARAÇÃO O ARRAY QUE SERÁ CRIADO.
echo "======FOR 3 (array)"

Frutas=(
'Laranja'
'Abacaxi'
'Cajá'
)

for i in "${Frutas[@]}"; do
  echo $i
done

#UTILIZANDO WHILE:
#NO WHILE É UTILIZADA TODA A FORMATAÇÃO PADRÃO E ATRIBUTOS DO IF.
echo "======FOR 4 (while)"
contador=0

while [[ contador -lt ${#Frutas[@]} ]]; do
  echo $contador
  contador=$(($contador+1))
done
