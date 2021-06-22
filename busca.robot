* Settings *
Documentation       Esse arquivo deveria estar dentro da pasta tests

#para vir de pasta, colocar resources/base.robot (pasta de onde veio).
#se vier da raiz tem que ser ${EXECDIR}/resources/base.robot
#essa variavel serve para pegar automaticamente o diretorio de execução
Resource         base.robot

* Test Cases *
Deve buscar um único restaurante
    Start Session
    Go to restaurants
    Search by                           Debuger
    Restaurant Should Be visible        DEBUGER KING
    #quando acontecer de repetir na tela, ele nao pegara. Entao usar o elemento abaixo para contar
    #e retornar apenas 1 elemento com o elemento
    Restaurante Count Should Be         1
    Take Screenshot

Deve buscar por categoria
    Start Session
    Go to restaurants
    Search by                           Cafe
    Restaurant Should Be visible        STARBUGS COFFEE
    Take Screenshot

Devo buscar todos os restaurantes
    Start Session
    Go To Restaurants
    Search by                           a
    Restaurante Count Should Be         5
    Take Screenshot

