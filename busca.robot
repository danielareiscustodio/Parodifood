* Settings *

Library         Browser

* Test Cases *
Buscar um Restaurante

    New Browser     chromium        False
    New Page        http://parofifood.qaninja.academy/
    #checkpoint
    Get Text        css=span        contains        Nunca foi tão engraçado pedir comida

    Click           text=Estou com fome!
    Get Text        css=h1 strong       contains        Ta na hora de matar a fome!

    Click           css=.search-link
    Fill Text       css=input[formcontrolname="searchControl"]      Debuger

    Wait For Elements State     css=.place-info-box     visible     10     
    Get Text        css=.place-info-box     contains    DEBUGER KING