*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.mercadolivre.com.br/
${INPUT}    cb1-edit
${BOTAO_BUSCA}    //button[@class='nav-search-btn']

*** Keywords ***

Aceitar cookies se aparecer
    ${is_visible}=    Run Keyword And Return Status    Element Should Be Visible    css=div.cookie-consent-banner-opt-out__container
    IF    ${is_visible}
        Click Button    //button[normalize-space()='Aceitar cookies']
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
    Click Button  ${BOTAO_BUSCA}
E selecionar o primeiro produto da lista de resultados
    Wait Until Element Is Visible    xpath=(//a[contains(@class, 'poly-component__title')])[1]
    Click Element                    xpath=(//a[contains(@class, 'poly-component__title')])[1]
