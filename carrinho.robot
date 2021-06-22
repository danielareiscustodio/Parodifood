*Settings*
Documentation       Arquivo de carrinho e que estara dentro da pasta tests. O arquivo cart.json vai estar dentro da pasta fixtures

#se vier da raiz tem que ser ${EXECDIR}/resources/base.robot
#essa variavel serve para pegar automaticamente o diretorio de execução
Resource        ${EXECDIR}/Parodifood/resources/base.robot

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
    &{restaurant}       Create Dictionary       restaurant=STARBUGS COFFEE        desc=Nada melhor que um café pra te ajudar a resolver um bug.
    Go To Restaurants
    Choose Restaurant       ${restaurant}
    #esse //span, foi um xpath feito na mao
    #span é a classe do texto, text é o texto que vc quer ou esta procurando, 
    #/.. é ir ate a div pai, a é o elemento que
    #esta o que esta buscanco, o @class é a classe do botao adicionar 
    Add to cart             Starbugs 500 error
    Should Add To Cart      Starbugs 500 error      
    Total Cart Should Be    15,60

Deve adicionar os 3 itens no carrinho
    ${cart_json}            Get JSON        cart.json   
    Go To Restaurants
    Choose Restaurant               ${cart_json}
    FOR     ${product}     IN       @{cart_json["products"]}
        Add to cart                 ${product["name"]}
        Should Add To Cart          ${product["name"]}
    END
    # Add to cart             Cappuccino com Chantilly
    # Should Add To Cart      Cappuccino com Chantilly
    # Add to cart             Super Espreso
    # Should Add To Cart      Super Espreso 
    # Add to cart             Starbugs 500 error
    # Should Add To Cart      Starbugs 500 error      
    Total Cart Should Be    ${cart_json["total"]}