*** Settings ***
Documentation    Documentação sobre a automação de um site de compra
Resource    mlivre_resources.robot  

*** Test Cases ***

Caso de teste 01: Procura e adiciona produtos ao carrinho
    [Documentation]    Acessa o Mercado Livre procura e adiciona ao carrinho 3 produtos
    Dado que estou na tela principal do site 
    E pesquisar por "Bola de futebol"  
    E selecionar o primeiro produto da lista de resultados 
