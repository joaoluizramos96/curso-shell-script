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

ListaUsuarios () {
    egrep -v "^#|^$" "$ARQUIVO_BANCO_DE_DADOS" | tr : " " > "$TEMP"
    dialog --title "Lista de Usuários" --textbox "$TEMP" 20 40
    rm -f "$TEMP"
}

ValidaExistenciaUsuario () {
    grep -i -q "$1$SEQ" "$ARQUIVO_BANCO_DE_DADOS"
}

OrdenarLista () {
    sort "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
    mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"
}
# ------------------------------------- EXECUÇÕES ---------------------------------------------------- #
while :
do
    acao=$(dialog --title "Gerenciamento de Usuários 2.0)" \
                  --stdout \
                  --menu "Escolha uma das opções abaixo:" \
                  0 0 0 \
                  listar "Listar todos os usuários do sistema" \
                  remover "Remover um usuário do sistema" \
                  inserir "Inserir um novo usuário no sistema")
    [ $? -ne 0 ] && exit

    case $acao in
        listar) ListaUsuarios   ;;
        remover)
            usuarios=$(egrep "^#|^$" -v "$ARQUIVO_BANCO_DE_DADOS" | sort -h | cut -d $SEP -f 1,2 | sed 's/:/ "/;s/$/"/')    
            id_usuario=$(eval dialog --stdout --menu \"Escolha um usuário:\" 0 0 0 $usuarios)
            [ $? -ne 0 ] && continue

            grep -i -v "^$id_usuario$SEP" "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
            mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"

            dialog --msgbox "Usuário removido com sucesso!"
            ListaUsuarios
        ;;
        inserir)
            ultimo_id="$(egrep -v "^#|^$" $ARQUIVO_BANCO_DE_DADOS | sort | tail -n -1 | cut -d $SEP -f 1)"
            proximo_id=$((ultimo_id+1))
            nome=$(dialog --title "Cadastro de Usuário" --stdout --inputbox "Digite o seu nome: " 0 0)
            [ ! "$nome" ] && exit 1

            ValidaExistenciaUsuario "$nome" && {
                dialog --title "ERRO FATAL!" --msgbox "Usuário já cadastrado no sistema!" 6 40
                exit 1
            }

            email=$(dialog --title "Cadastro de Usuário" --stdout --inputbox "Digite o seu e-mail: " 0 0)
            [ $? -ne 0 ] && continue

            echo "$proximo_id$SEP$nome$SEP$email" >> "$ARQUIVO_BANCO_DE_DADOS"

            dialog --title "SUCESSO!!" --msgbox "Usuário cadastrado com sucesso!" 6 40

            ListaUsuarios
        ;;
    esac
done

# ---------------------------------------------------------------------------------------------------- #
