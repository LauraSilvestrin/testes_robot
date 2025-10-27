*** Settings ***
Documentation    Documentação sobre a automação de um site de compra
Resource    site_resources.robot

*** Test Cases ***
Casos de teste 01: Verificar título da página na amazon
    [Documentation]    Acessa página de eletrônicos da Amazon e verifica o seu título
    Dado que estou na tela principal do site
    Quando eu clicar na opção "Eletrônicos"
    Então deve apresentar o título da página "Eletrônicos e Tecnologia | Amazon.com.br"
