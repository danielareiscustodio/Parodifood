*Settings*
Documentation       Ações do carrinho de compras

*Keywords*
Choose Restaurant
    [Arguments]     ${super_var} 
    #ao inves de usar 2 argumentos, agora por causa da super variavel sera usado 1 so
    #[Arguments]     ${name}     ${description}
    Click           text=${super_var["restaurant"]}
    #checkpoint - verificar que realmente esta na tela. Verifica ate 10 segundos que o elemento esteja visivel
    Wait For Elements State     css=#detail     visible     10
    #o get text verifica que realmente na tela no css x esta aparecendo o texto esperado
    Get Text        css=#detail     contains       ${super_var["desc"]}

Add to cart
    [Arguments]     ${name}
    Click           xpath=//span[text()="${name}"]/..//a[@class="add-to-cart"]

Should Add To Cart
    [Arguments]     ${name}
    Wait For Elements State     css=#cart tr >> text=${name}      visible     5

 Total Cart Should Be
    [Arguments]     ${total}
    #vai imprimir no log o valor
    Log             ${total}
    #esse contains text com virgula significa que vai encontrar o texto
    Get Text        xpath=//th[contains(text(),"Total")]/..//td     contains        ${total}      
