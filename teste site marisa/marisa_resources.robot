*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.marisa.com.br/
${INPUT}    //input[contains(@class, 'js-site-search-input')]
${BTN_BUSCA}    //div[@class='input-group']//button[@type='submit']
${BTN_CARRINHO}    //button[normalize-space()='ADICIONAR À SACOLA']
${BTN_CONTINUAR_COMPRANDO}    //a[normalize-space()='CONTINUAR COMPRANDO']
*** Keywords ***

Aceitar cookies se aparecer
    Wait Until Keyword Succeeds    5x    2s    Verificar e aceitar cookies

Verificar e aceitar cookies
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    css=[data-cookiefirst-widget="banner"]
    IF    ${is_visible}
        Wait Until Element Is Visible    //button[@title='Aceitar todos cookie']    timeout=10s
        Click Button    //button[@title='Aceitar todos cookie']
        Log    Cookies aceitos com sucesso.
    ELSE
        Log    Nenhum banner de cookies visível.
    END

Selecionar tamanho se existir
    ${existe_tamanho}=    Run Keyword And Return Status    Element Should Be Visible    //ul[contains(@class,'list-inline')]//a[contains(@class, 'js-product-select-size')]
    IF    ${existe_tamanho}
        Wait Until Element Is Visible    (//ul[contains(@class,'list-inline')]//a[contains(@class, 'js-product-select-size')])[1]    10s
        Click Element                    (//ul[contains(@class,'list-inline')]//a[contains(@class, 'js-product-select-size')])[1]
        Log    Primeiro tamanho selecionado com sucesso.
    ELSE
        Log    Nenhum tamanho disponível para seleção.
    END

# === DADO ===

Dado que estou na tela principal do site
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Aceitar cookies se aparecer

# === E ===

E pesquisar por ${PRODUTO}
    Wait Until Element Is Visible    ${INPUT}
    Input Text    ${INPUT}    ${PRODUTO}      
    Click Button  ${BTN_BUSCA}
E selecionar o primeiro produto da lista de resultados
    Wait Until Element Is Visible    (//a[contains(@href, '/p/')])[1]    15s
    Click Element                    (//a[contains(@href, '/p/')])[1]
    Log    Primeiro produto clicado com sucesso.

E adicionar o produto ao carrinho
    Selecionar tamanho se existir
    Wait Until Element Is Visible    ${BTN_CARRINHO}    10s
    Click Element                    ${BTN_CARRINHO}
    Wait Until Element Is Visible    ${BTN_CONTINUAR_COMPRANDO}    10s
    Click Element                    ${BTN_CONTINUAR_COMPRANDO}
    Log    Produto adicionado ao carrinho com sucesso.