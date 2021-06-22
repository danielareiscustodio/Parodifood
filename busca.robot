* Settings *

Library         Browser

* Test Cases *
Deve buscar um único restaurante

    New Browser     chromium        False
    New Page        http://parodifood.qaninja.academy/
    #checkpoint
    Get Text        css=span        contains        Nunca foi tão engraçado pedir comida

    Click           text=Estou com fome!
    Get Text        css=h1 strong       contains        Ta na hora de matar a fome!

    Click           css=.search-link
    Fill Text       css=input[formcontrolname="searchControl"]      Debuger

    Wait For Elements State     css=div[class="place-info-box"][style="opacity: 1;"]     visible     10     
    Get Text        css=.place-info-box     contains    DEBUGER KING

    #quando acontecer de repetir na tela, ele nao pegara. Entao usar o elemento abaixo para contar
    #e retornar apenas 1 elemento com o elemento
    Get Element Count       css=.place-info-box     equal       1

    Take Screenshot

Deve buscar por categoria

    New Browser     chromium        False
    New Page        http://parodifood.qaninja.academy/
    #checkpoint
    Get Text        css=span        contains        Nunca foi tão engraçado pedir comida

    Click           text=Estou com fome!
    Get Text        css=h1 strong       contains        Ta na hora de matar a fome!

    Click           css=.search-link
    Fill Text       css=input[formcontrolname="searchControl"]      Cafe

    Wait For Elements State     css=div[class="place-info-box"][style="opacity: 1;"]     visible     10     
    Get Text        css=.place-info-box     contains    STARBUGS COFFEE

    Take Screenshot
