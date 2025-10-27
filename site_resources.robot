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
${BOTAO_ADICIONAR_AO_CARRINHO}    add-to-cart-button
${BOTAO_NAO_INCLUIR_PROTECAO}    //input[@aria-labelledby='attachSiNoCoverage-announce']
${MSG_SUCESSO_ADICIONAR_AO_CARRINHO}    //h1[@class='a-size-medium-plus a-color-base sw-atc-text a-text-bold']
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
E ao acessar o produto "XBox Series 5"
    Wait Until Element Is Visible    ${RESULTADO_BUSCA}    10s
    Click Element    ${RESULTADO_BUSCA}

E clicar em "Adicionar ao carrinho"
    Wait Until Element Is Visible   ${BOTAO_ADICIONAR_AO_CARRINHO}  10s
    Click Element    ${BOTAO_ADICIONAR_AO_CARRINHO}
    Wait Until Element Is Visible   ${BOTAO_NAO_INCLUIR_PROTECAO}  10s
    Click Element    ${BOTAO_NAO_INCLUIR_PROTECAO}


E deve apresentar a mensagem "Adicionado ao carrinho"
    Wait Until Element Is Visible   ${MSG_SUCESSO_ADICIONAR_AO_CARRINHO}
    