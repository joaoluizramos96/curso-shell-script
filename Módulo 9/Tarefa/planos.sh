# ------------------------------------- VARIÁVEIS ---------------------------------------------------- #
ARQUIVO_BANCO_DE_DADOS="bd.txt"
SEP=:
TEMP=temp.$$
VERDE="\033[32;1m"
VERMELHO="\033[31;1m"

# ------------------------------------- TESTES ---------------------------------------------------- #
[ ! -e $ARQUIVO_BANCO_DE_DADOS ] && echo "ERRO: arquivo não existe." && exit 1
[ ! -r $ARQUIVO_BANCO_DE_DADOS ] && echo "ERRO: arquivo não tem permissão de leitura." && exit 1
[ ! -w $ARQUIVO_BANCO_DE_DADOS ] && echo "ERRO: arquivo não tem permissão de escrita." && exit 1
# ------------------------------------- FUNÇÕES ---------------------------------------------------- #
MostraUsuariosNaTela () {
    local id="$(echo $1 | cut -d $SEP -f 1)"
    local nome="$(echo $1 | cut -d $SEP -f 2)"
    local plano="$(echo $1 | cut -d $SEP -f 3)"
    echo -e "${VERDE}ID: ${VERMELHO}$id"
    echo -e "${VERDE}NOME: ${VERMELHO}$nome"
    echo -e "${VERDE}PLANO: ${VERMELHO}$plano"
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
        echo "ERRO! Este usuário já possui um plano conosco."
    else
        echo "$*" >> "$ARQUIVO_BANCO_DE_DADOS"
        echo "Usuário realizou o contrato com sucesso!!"
    fi

    OrdenarLista
}

Descontrato () {
    ValidaExistenciaUsuario "$1" || return

    grep -i -v "$1$SEP" "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
    mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"
    echo "Usuário desfez o contrato com sucesso!"

    OrdenarLista
}

OrdenarLista () {
    sort "$ARQUIVO_BANCO_DE_DADOS" > "$TEMP"
    mv "$TEMP" "$ARQUIVO_BANCO_DE_DADOS"
}