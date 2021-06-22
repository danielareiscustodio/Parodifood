* Settings *
Documentation       Esse arquivo deve estar dentro da pasta resources

Library             Browser
Library             OperatingSystem

#viria da pasta action - actions/search.robot
Resource            search.robot

* Keywords *
Start Session
    New Browser     chromium        False
    New Page        http://parodifood.qaninja.academy/
    #checkpoint
    Get Text        css=span        contains        Nunca foi tão engraçado pedir comida

### Helpers ###
Get JSON
    [Arguments]     ${file_name}
    #outro exemplo de caminho é ${EXECDIR}/resources/fixtures/${file_name}
    ${file}             Get File        ${EXECDIR}/${file_name}
    ${super_var}        Evaluate        json.loads($file)      json        
    [return]            ${super_var}
