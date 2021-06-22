* Settings *
Documentation       Esse arquivo deveria estar dentro da pasta tests

#para vir de pasta, colocar resources/base.robot (pasta de onde veio).
#se vier da raiz tem que ser ${EXECDIR}/resources/base.robot
#essa variavel serve para pegar automaticamente o diretorio de execução
Resource         ${EXECDIR}/resources/base.robot

#vai executar toda vez que começar um teste
Test Setup          Start Session
#essa keyword sera executada toda vez que um teste for finalizado
Test Teardown       Take Screenshot

* Test Cases *
Deve buscar um único restaurante
    Go to restaurants
    Search by                           Debuger
    Restaurant Should Be visible        DEBUGER KING
    #quando acontecer de repetir na tela, ele nao pegara. Entao usar o elemento abaixo para contar
    #e retornar apenas 1 elemento com o elemento
    Restaurante Count Should Be         1
    
Deve buscar por categoria
    Go to restaurants
    Search by                           Cafe
    Restaurant Should Be visible        STARBUGS COFFEE
    
Devo buscar todos os restaurantes
    Go To Restaurants
    Search by                           a
    Restaurante Count Should Be         5
    
