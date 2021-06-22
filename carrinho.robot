*Settings*
Documentation       Arquivo de carrinho e que estara dentro da pasta tests

#se vier da raiz tem que ser ${EXECDIR}/resources/base.robot
#essa variavel serve para pegar automaticamente o diretorio de execução
Resource         base.robot

Test Setup      Start Session
Test Teardown   Take Screenshot

*Test Cases*
Deve adicionar um item ao carrinho
    #set variable serve para guardar informações
    #${name}     Set Variable        STARBUGS COFFEE
    #${desc}     Set Variable        Nada melhor que um café pra te ajudar a resolver um bug.
    #Go To Restaurants
    #aqui foi usado o set variable para guardar o texto e so depois usar ele para nao ficar muito longo na tela
    #Choose Restaurant       ${name}     ${desc}       
    #os 3 pontos significa que quando o texto for longo vc pode colocar ele
    #...         STARBUGS COFFEE     Nada melhor que um café pra te ajudar a resolver um bug.

    #o & na frente significa que e uma super variavel que guarda um dicionario de coisas
    #mas para usar ela, precisa ainda ser com $
    &{restaurant}       Create Dictionary       name=STARBUGS COFFEE        desc=Nada melhor que um café pra te ajudar a resolver um bug.
    Go To Restaurants
    Choose Restaurant       ${restaurant}
    #esse //span, foi um xpath feito na mao
    #span é a classe do texto, text é o texto que vc quer ou esta procurando, 
    #/.. é ir ate a div pai, a é o elemento que
    #esta o que esta buscanco, o @class é a classe do botao adicionar 
    Add to cart             Starbugs 500 error

*Keywords*
Choose Restaurant
    [Arguments]     ${restaurant} 
    #ao inves de usar 2 argumentos, agora por causa da super variavel sera usado 1 so
    #[Arguments]     ${name}     ${description}
    Click           text=${restaurant["name"]}
    #checkpoint - verificar que realmente esta na tela. Verifica ate 10 segundos que o elemento esteja visivel
    Wait For Elements State     css=#detail     visible     10
    #o get text verifica que realmente na tela no css x esta aparecendo o texto esperado
    Get Text        css=#detail     contains       ${restaurant["desc"]}

Add to cart
    [Arguments]     ${name}
    Click           xpath=//span[text()="${name}"]/..//a[@class="add-to-card"]
