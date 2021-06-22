*Settings*

Resource         ${EXECDIR}/Parodifood/resources/base.robot

Test Setup      Start Session
Test Teardown   Take Screenshot

*Test Cases*
Deve realizar um novo pedido
    ${order_json}       Get JSON        order.json
    Go To Restaurants
    Choose Restaurant       ${order_json}
     FOR     ${product}     IN      @{order_json["products"]}
        Add to cart                 ${product["name"]}
        Should Add To Cart          ${product["name"]}
    END
    #checkpoint para provar que esta na tela mesmo
    Go Checkout
    Fill Data Customer          ${order_json["customer"]}
    Select Payment Option       ${order_json["payment"]}
    
*Keywords*
Go Checkout
    Click                       text=Fechar Pedido  
    ${element}                  Set Variable        css=.page-header
    Wait For Elements State     ${element}          visible     10  
    Get Text                    ${element}          contains    Finalize o seu pedido

Fill Data Customer
    [Arguments]     ${customer}
    Fill Text       css=input[placeholder="Nome"]             ${customer["name"]}
    Fill Text       css=input[placeholder="E-mail"]           ${customer["email"]}
    #o ^ significa que é onde comecar com a palavra confirmação
    Fill Text       css=input[placeholder^="Confirmação"]     ${customer["email"]}
    Fill Text       css=input[placeholder="Endereço"]         ${customer["address"]}
    Fill Text       css=input[placeholder="Número"]           ${customer["number"]}

Select Payment Option
    [Arguments]     ${payment}

    IF      "${payment}" == "Dinheiro"
    #opção 1 é opção dinheiro, cartao de debito é 2 e cartao de refeicao e 3
        Click    xpath=(//mt-radio//label)[1]//div

    ELSE IF    "${payment}" == "Cartão de Débito"  
        Click     xpath=(//mt-radio//label)[2]//div

    ELSE IF    "${payment}" == "Cartão de Refeição"  
        Click    xpath=(//mt-radio//label)[3]//div

    ELSE 
        #ou pode usar o Log também
        Fail     Incorrect payment type    

    END   


