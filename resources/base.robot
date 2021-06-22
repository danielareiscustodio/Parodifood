* Settings *
Documentation       Esse arquivo deve estar dentro da pasta resources

Library             Browser
Library             OperatingSystem

#viria da pasta action - actions/search.robot
Resource            actions/search.robot
Resource            actions/cart.robot
Resource            actions/order.robot

*Variables*
${DEFAULT_TIMEOUT}      10

* Keywords *
Start Session
    #quando quiser rodar pelo browser que quiser, fazer como abaixo e depois rodar 
    #robot -d ./logs -v browser:firefox -v headless:False tests
    #New Browser     ${browser}        ${headless}
    New Browser     chromium        True
    New Page        http://parodifood.qaninja.academy/
    #checkpoint
    Get Text        css=span        contains        Nunca foi tão engraçado pedir comida

### Helpers ###
Get JSON
    [Arguments]     ${file_name}
    #outro exemplo de caminho é ${EXECDIR}/resources/fixtures/${file_name}
    ${file}             Get File        ${EXECDIR}/Parodifood/resources/fixtures/${file_name}
    ${super_var}        Evaluate        json.loads($file)      json        
    [return]            ${super_var}
