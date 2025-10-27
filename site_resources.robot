*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}          https://www.amazon.com.br/
${ELETRONICOS}  //a[contains(text(),'Eletrônicos')]
${TITULO}       Eletrônicos e Tecnologia | Amazon.com.br
${INPUT}        id=twotabsearchtextbox          
${BOTAO_BUSCA}  id=nav-search-submit-button     
${PRODUTO}      XBox Series 5
${RESULTADO_BUSCA}  //span[contains(text(),'Microsoft Xbox Series S 512 GB All-Digital Console')]
*** Keywords ***

# === DADO ===
Dado que estou na tela principal do site
    Open Browser    ${URL}    chrome
    Maximize Browser Window

# === QUANDO ===
Quando eu clicar na opção "Eletrônicos"
    Wait Until Element Is Enabled    ${ELETRONICOS}    10s
    Click Element    ${ELETRONICOS}

Quando eu procurar o produto "${PRODUTO}"
    Wait Until Element Is Visible    ${INPUT}
    Input Text    ${INPUT}    ${PRODUTO}      
    Click Button  ${BOTAO_BUSCA}                  

# === ENTÃO ===
Então deve apresentar o título da página "${TITULO}"
    Title Should Be    ${TITULO}

Então deve apresentar o produto "${PRODUTO}"
    Wait Until Page Contains    ${PRODUTO}

# === E ===
