#!/usr/bin/env bash
#
#
# Site: https://www.meusite.com.br
# Autor: João Luiz Ramos
# Manutenção: João Luiz Ramos
#
# ----------------------------------------------------------------------------------------- #
#
# Sistema de usuários, utilizando Banco de Dados (.txt)
#
# ----------------------------------------------------------------------------------------- #
#
# Histórico de versões:
# 
#          v1.0 - 02/02/2022, João
#              Versão inicial do programa
#
# ----------------------------------------------------------------------------------------- #
#
# Testado em:
#   zsh 5.8.1
#
# ------------------------------------- VARIÁVEIS ---------------------------------------------------- #
ARQUIVO_BANCO_DE_DADOS="banco_de_dados.txt"

VERDE="\033[32;1m"
VERMELHO="\033[31;1m"

# ------------------------------------- TESTES ---------------------------------------------------- #
[ ! -e $ARQUIVO_BANCO_DE_DADOS ] && echo "ERRO: arquivo não existe." && exit 1
[ ! -r $ARQUIVO_BANCO_DE_DADOS ] && echo "ERRO: arquivo não tem permissão de leitura." && exit 1
[ ! -w $ARQUIVO_BANCO_DE_DADOS ] && echo "ERRO: arquivo não tem permissão de escrita." && exit 1
# ------------------------------------- FUNÇÕES ---------------------------------------------------- #
ListaUsuarios () {
    while read -r linha
    do
        [ "$(echo $linha | cut -c1)" = "#" ] && continue
        [ ! "$linha" ] && continue

        local id="$(echo $linha | cut -d : -f 1)"
        local nome="$(echo $linha | cut -d : -f 2)"
        local email="$(echo $linha | cut -d : -f 3)"

        echo -e "${VERDE}ID: ${VERMELHO}$id"
        echo -e "${VERDE}NOME: ${VERMELHO}$nome"
        echo -e "${VERDE}E-MAIL: ${VERMELHO}$email"
    done < "$ARQUIVO_BANCO_DE_DADOS"

}
# ------------------------------------- EXECUÇÕES ---------------------------------------------------- #
#
#
#
#
#
#
#
#
#
#
