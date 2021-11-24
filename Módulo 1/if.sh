#!/usr/bin/env bash

VAR=""
VAR2="a"

#FORMA PADRÃO:
if [[ "$VAR" = "$VAR2" ]]; then
  echo "São iguais."
fi

#"QUEBRANDO" O THEN:
if [[ "$VAR" = "$VAR2" ]]
then
  echo "São iguais."
fi

#UTILIZANDO O TEST:
if test "$VAR" = "$VAR2"; then
  echo "São iguais."
fi

#UTILIZANDO O TEST "QUEBRANDO" O THEN:
if test "$VAR" = "$VAR2"
then
  echo "São iguais."
fi

#UTILIZANDO O MODO PADRÃO, MAS COM APENAS 1 PAR DE COLCHETES (TAMBÉM É POSSÍVEL "QUEBRAR" O THEN):
if [ "$VAR" = "$VAR2" ]; then
  echo "São iguais."
fi

#FORMA REDUZIDA (PRÁTICA DE "CÓDIGO LIMPO"):
#&& = AND - comparando se os itens são verdadeiros;
#|| = OR - comparando se os itens são falsos.
[ "$VAR" = "$VAR2" ] && echo "São iguais."
[ "$VAR" = "$VAR2" ] || echo "São diferentes."
