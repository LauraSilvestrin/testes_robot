*** Settings ***
Library    SeleniumLibrary

*** Variables ***

*** Keywords ***


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
