*** Settings ***
Documentation    Documentação sobre a automação de um site de compra
Resource    marisa_resources.robot  

*** Test Cases ***

Caso de teste 01: Procura e adiciona produtos ao carrinho
    [Documentation]    Acessa o Mercado Livre procura e adiciona ao carrinho 3 produtos
    Dado que estou na tela principal do site 
    E pesquisar por "Camiseta"  
    E selecionar o primeiro produto da lista de resultados 
    E adicionar o produto ao carrinho 
    # E pesquisar por "Peteca" 
    # E selecionar o primeiro produto da lista de resultados 
    # E adicionar o produto ao carrinho 
    # E eu retornar à página inicial 
    # E pesquisar por "Patins" 
    # E selecionar o primeiro produto da lista de resultados 
    # E adicionar o produto ao carrinho
    # Quando eu acessar o carrinho 
    # Então devo ver três produtos listados no meu carrinho