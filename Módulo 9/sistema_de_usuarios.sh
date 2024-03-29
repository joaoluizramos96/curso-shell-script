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
SEP=:
TEMP=temp.$$
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"

# ------------------------------------- TESTES ---------------------------------------------------- #
[ ! -e $ARQUIVO_BANCO_DE_DADOS ] && echo "ERRO: arquivo não existe." && exit 1
[ ! -r $ARQUIVO_BANCO_DE_DADOS ] && echo "ERRO: arquivo não tem permissão de leitura." && exit 1
[ ! -w $ARQUIVO_BANCO_DE_DADOS ] && echo "ERRO: arquivo não tem permissão de escrita." && exit 1
[ ! -x "$(which dialog)" ] && sudo apt install dialog 1> /dev/null 2>&1
# ------------------------------------- FUNÇÕES ---------------------------------------------------- #
MostraUsuariosNaTela () {
    local id="$(echo $1 | cut -d $SEP -f 1)"
    local nome="$(echo $1 | cut -d $SEP -f 2)"
    local email="$(echo $1 | cut -d $SEP -f 3)"
    echo -e "${VERDE}ID: ${VERMELHO}$id"
    echo -e "${VERDE}NOME: ${VERMELHO}$nome"
    echo -e "${VERDE}E-MAIL: ${VERMELHO}$email"
}

ListaUsuarios () {
    while read -r linha
    do
        [ "$(echo $linha | cut -c1)" = "#" ] && continue
        [ ! "$linha" ] && continue
        MostraUsuariosNaTela "$linha"
    done < "$ARQUIVO_BANCO_DE_DADOS"
}

ValidaExistenciaUsuario () {
    grep -i -q "$1$SEQ" "$ARQUIVO_BANCO_DE_DADOS"
}

InserirUsuario () {
    local nome="$(echo $1 | cut -d $SEP -f 2)"

    if ValidaExistenciaUsuario "$nome"
    then
        echo "ERRO! Usuário existente!"
    else
        echo "$*" >> "$ARQUIVO_BANCO_DE_DADOS"
        echo "Usuário cadastrado com sucesso!!"
    fi

    OrdenarLista
}

ApagarUsuario () {
    ValidaExistenciaUsuario "$1" || return

    grep -i -v "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
    mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"
    echo "Usuário removido com sucesso!"

    OrdenarLista
}

OrdenarLista () {
    sort "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
    mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"
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
