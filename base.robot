* Settings *
Documentation       Esse arquivo deve estar dentro da pasta resources

Library             Browser

#viria da pasta action - actions/search.robot
Resource            search.robot

* Keywords *
Start Session
    New Browser     chromium        False
    New Page        http://parodifood.qaninja.academy/
    #checkpoint
    Get Text        css=span        contains        Nunca foi tão engraçado pedir comida

