*Settings*
Documentation       Arquivo de carrinho e que estara dentro da pasta tests

#se vier da raiz tem que ser ${EXECDIR}/resources/base.robot
#essa variavel serve para pegar automaticamente o diretorio de execução
Resource         base.robot

Test Setup      Start Session
Test Teardown   Take Screenshot

*Test Cases*
Deve adicionar um item ao carrinho
    Go To Restaurants
    Click Text      Text=STARBUGS COFFEE
    #checkpoint - verificar que realmente esta na tela. Verifica ate 10 segundos que o elemento esteja visivel
    Wait For Elements State     css=#detail     visible     
    #o get text verifica que realmente na tela no css x esta aparecendo o texto esperado
    Get Text        css=#detail     contains        Nada melhor que um café pra te ajudar a resolver um bug.
    