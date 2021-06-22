* Settings *
Documentation       Esse arquivo estar dentro da pasta action. Ações da funcionalidade de busca de restaurante

* Keywords *
Start Session
    New Browser     chromium        False
    New Page        http://parodifood.qaninja.academy/
    #checkpoint
    Get Text        css=span        contains        Nunca foi tão engraçado pedir comida

Go To Restaurants
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




