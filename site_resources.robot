*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.amazon.com.br/
${ELETRONICOS}  //a[contains(text(),'Eletrônicos')]
${TITULO}       Eletrônicos e Tecnologia | Amazon.com.br
*** Keywords ***

# === DADO ===
Dado que estou na tela principal do site
    Open Browser    ${URL}    chrome
    Maximize Browser Window

# === QUANDO ===
Quando eu clicar na opção "Eletrônicos"
    Wait Until Element Is Enabled    ${ELETRONICOS}    10s
    Click Element    ${ELETRONICOS}
# === ENTÃO ===
Então deve apresentar o título da página "${TITULO}"
    Title Should Be    ${TITULO}

# === E ===
