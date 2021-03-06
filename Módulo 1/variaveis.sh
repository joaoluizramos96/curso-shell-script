#!/usr/bin/env bash

#STRING.
echo " "
echo "------VARIÁVEIS------"
echo " "
NOME="João Luiz"

#FORMATAÇÃO DE STRING.
NOME_FORMATADO="
João

Luiz"

echo "$NOME"
echo "$NOME_FORMATADO"

#OPERAÇÃO DE NÚMEROS INTEIROS | PARA OPERAÇÕES, UTILIZAR DOIS PARES DE PARÊNTESES.
NUMERO_1=20
NUMERO_2=30
TOTAL=$(($NUMERO_1+$NUMERO_2))

#POR VIA DE REGRA, SEMPRE MANTER AS ASPAS AO "PRINTAR" AS VARIÁVEIS.
echo "$TOTAL"

#GRAVANDO SAÍDA DE COMANDOS EM VARIÁVEIS | PARA COMANDOS, UTILIZAR UM PAR DE PARÊNTESES.
SAIDA_CAT=$(cat /etc/passwd | grep joao)
echo $SAIDA_CAT
echo " "
echo "------VARIÁVEIS RESERVADAS------"
echo " "
#ADICIONANDO PARÂMETROS NAS VARIÁVEIS - CADA UM FICA ARMAZENADO EM SUA ORDEM DE ADIÇÃO.
#EX: ./variaveis.sh -a -b. O -a FICARÁ ARMAZENADO NO $1 E O -b FICARÁ ARMAZENADO NO $2.
echo "Parâmetro 1: $1"
echo "Parâmetro 2: $2"

#VISUALIZAR TODOS OS PARÂMETROS ENVIADOS:
echo "Todos os parâmetros: $*"

#CONTANDO QUANTOS PARÂMETROS FORAM ENVIADOS:
echo "Quantos parâmetros foram enviados? $#"

#SAÍDA DO ÚLTIMO COMANDO. POR PADRÃO, 0 INDICA QUE ESTÁ TUDO OK E 1 INDICA QUE HOUVE ALGUM ERRO NO COMANDO ANTERIOR.
echo "Saída do último comando: $?"

#SAÍDA DO PID (PROCESS ID) DE EXECUÇÃO DO PROGRAMA:
echo "PID: $$"

#SAÍDA DO NOME DO SCRIPT EM EXECUÇÃO:
echo "Nome do script: $0"
