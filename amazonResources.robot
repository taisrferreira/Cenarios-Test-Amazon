*** Settings ***
Library         SeleniumLibrary

*** Variables ***
${URL}                           https://www.amazon.com.br/
${MENU_ELETRONICOS}              //a[@href='/Eletronicos-e-Tecnologia/b/?ie=UTF8&node=16209062011&ref_=nav_cs_electronics'][contains(.,'Eletrônicos')]
${HEARD_ELETRONICOS}             //h1[contains(.,'Eletrônicos e Tecnologia')]
     
*** Keywords ***
Abrir o navegador  
    Open Browser                        browser=chrome
    Maximize Browser Window

Fechar o navegador
    Capture Page Screenshot
    Close Browser

Acessar a home page do site Amazon.com.br
    Go To                               url=${URL}
    Wait Until Element Is Visible       locator=${MENU_ELETRONICOS}

Entrar no menu "Eletrônicos"
    Click Element                       locator=${MENU_ELETRONICOS}

Verificar se aparece a frase "${FRASE}"
    Wait Until Page Contains            text=${FRASE}
    Wait Until Element Is Visible       locator=${HEARD_ELETRONICOS}

Verificar se o título da página fica "${TITULO}"    
    Title Should Be                     title=${TITULO}      

Verificar se aparece a categoria "${NOME_CATEGORIA}"
    Element Should Be Visible           locator=//a[@aria-label='${NOME_CATEGORIA}']

Digitar o nome de produto "${PRODUTO}" no campo de pesquisa
    Input text                  locator=twotabsearchtextbox         text=${PRODUTO}

Clicar no botão de pesquisa
    Click Element               locator=nav-search-submit-text

Verificar o resultado da pesquisa, listando o produto "${PRODUTO}"
    Wait Until Element Is Visible       locator=(//span[contains(.,'${PRODUTO}')])[3]