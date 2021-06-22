* Settings *
Documentation       Esse arquivo estar dentro da pasta action. Ações da funcionalidade de busca de restaurante

* Variables *
${DIV_BOX_RESTAURANT}       css=div[class="place-info-box"][style="opacity: 1;"]       

* Keywords *
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
    Wait For Elements State     ${DIV_BOX_RESTAURANT}     visible     ${DEFAULT_TIMEOUT}      
    Get Text                    ${DIV_BOX_RESTAURANT}     contains    ${name}

Restaurante Count Should Be
    [Arguments]     ${qtd}
    Wait For Elements State     ${DIV_BOX_RESTAURANT}      visible     ${DEFAULT_TIMEOUT} 
    Get Element Count           ${DIV_BOX_RESTAURANT}      equal       ${qtd}




