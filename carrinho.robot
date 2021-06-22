*Settings*
Documentation       Arquivo de carrinho e que estara dentro da pasta tests

#se vier da raiz tem que ser ${EXECDIR}/resources/base.robot
#essa variavel serve para pegar automaticamente o diretorio de execução
Resource         base.robot

Test Setup      Start Session
Test Teardown   Take Screenshot

*Test Cases*
Deve adicionar um item ao carrinho
    ${name}     Set Variable        STARBUGS COFFEE
    ${desc}     Set Variable        Nada melhor que um café pra te ajudar a resolver um bug.
    Go To Restaurants
    #aqui foi usado o set variable para guardar o texto e so depois usar ele para nao ficar muito longo na tela
    Choose Restaurant       ${name}     ${desc}       
    #os 3 pontos significa que quando o texto for longo vc pode colocar ele
    #...         STARBUGS COFFEE     Nada melhor que um café pra te ajudar a resolver um bug.

*Keywords*
Choose Restaurant
    [Arguments]     ${name}     ${description}
     
    Click Text      text=${name}
    #checkpoint - verificar que realmente esta na tela. Verifica ate 10 segundos que o elemento esteja visivel
    Wait For Elements State     css=#detail     visible     10
    #o get text verifica que realmente na tela no css x esta aparecendo o texto esperado
    Get Text        css=#detail     contains        ${description}