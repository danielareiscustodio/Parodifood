* Settings *

Library         Browser

* Test Cases *
Deve buscar um único restaurante
    Start Session
    Go to restaurantes
    Search by                           Debuger
    Restaurant Should Be visible        DEBUGER KING
    #quando acontecer de repetir na tela, ele nao pegara. Entao usar o elemento abaixo para contar
    #e retornar apenas 1 elemento com o elemento
    Restaurante Count Should Be         1
    Take Screenshot

Deve buscar por categoria
    Start Session
    Go to restaurantes a fome!
    Search by                           Cafe
    Restaurant Should Be visible        STARBUGS COFFEE
    Take Screenshot

Devo buscar todos os restaurantes
    Start Session
    Go to restaurantes
    Search by                           a

    Restaurante Count Should Be         5

    Take Screenshot

* Keywords *
Start Session
    New Browser     chromium        False
    New Page        http://parodifood.qaninja.academy/
    #checkpoint
    Get Text        css=span        contains        Nunca foi tão engraçado pedir comida

Go to restaurantes
    Click           text=Estou com fome!
    Get Text        css=h1 strong       contains        Ta na hora de matar a fome!

Search by
#busca por varios tipos de textos
    [Arguments]     ${value}
    Click           css=.search-link
    Fill Text       css=input[formcontrolname="searchControl"]      ${value} 

Restaurant Should Be visible
    [Arguments]     ${name}
    Wait For Elements State     css=div[class="place-info-box"][style="opacity: 1;"]     visible     10     
    Get Text                    css=.place-info-box     contains    ${name}

Restaurante Count Should Be
    [Arguments]     ${qtd}
    Wait For Elements State     css=.place-info-box      visible     10
    Get Element Count           css=.place-info-box      equal       ${qtd}


