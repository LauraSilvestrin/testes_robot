*** Settings ***
Documentation    Documentação sobre a automação de um site de compra
Resource    site_resources.robot

*** Test Cases ***
Casos de teste 01: Verificar título da página na amazon
    [Documentation]    Acessa página de eletrônicos da Amazon e verifica o seu título
    Dado que estou na tela principal do site
    Quando eu clicar na opção "Eletrônicos"
    Então deve apresentar o título da página "Eletrônicos e Tecnologia | Amazon.com.br"

Caso de teste 02: Pesquisar produto
    [Documentation]    Pesquisa produto na Amazon e verifica se ele aparece nos resultados
    Dado que estou na tela principal do site
    Quando eu procurar o produto "XBox Series 5"
    Então deve apresentar o produto "XBox Series 5"

Caso de teste 03: Adicionar produto ao carrinho
    [Documentation]    Pesquisa produto na Amazon e adiciona ao carrinho
    Dado que estou na tela principal do site
    Quando eu procurar o produto "XBox Series 5"
    Então deve apresentar o produto "XBox Series 5"
    E ao acessar o produto "XBox Series 5"
    E clicar em "Adicionar ao carrinho"
    E deve apresentar a mensagem "Adicionado ao carrinho"

Caso de teste 04: Adicionar e remover produto do carrinho
    [Documentation]    Pesquisa produto na Amazon, adiciona ao carrinho e depois remove
    Dado que estou na tela principal do site
    Quando eu procurar o produto "XBox Series 5"
    Então deve apresentar o produto "XBox Series 5"
    E ao acessar o produto "XBox Series 5"
    E adicionar o produto ao carrinho
    Quando eu acessar o carrinho
    E remover o produto do carrinho
    Então deve apresentar a mensagem de removido do carrinho