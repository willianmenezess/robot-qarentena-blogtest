*** Settings ***
Library  SeleniumLibrary  # instanciando a biblioteca (librarie) SeleniumLibrary


*** Variables ***  # variáveis globais (${variável})
${URL}  https://robotizandotestes.blogspot.com/
${BROWSER}  Chrome
${BTN_SEARCH}  class=search-expand.touch-icon-button
${INPUT_SEARCH}  name=q
${SUBMIT_SEARCH}  class=search-action.flat-button
${LOCATION_IMG_ROBO}  xpath=//img[@src='https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEi5N1_Bgt36fuAorEpn4j1gHZGjbTRjHVBBRLe1PWKooCSbohE4ZTbij8mx0Bdex5Y1mq3srYBnWzgXXxuWOCjkp2hR4NC_p4sZ2hoe-jFhjau8HgZZosBorNtGYFupFOse4vt4uhv9GstH/s320/robotfw_mark_black_low.png']


*** Keywords ***

# keywords do teste 01
Acessar a página do blog
    Open Browser  ${URL}  ${BROWSER}  # verifica se a página foi aberta
    Title Should Be  Robotizando Testes  # verifica se o título da página é "Robotizando Testes"

Pesquisar por um post com "${TEXT_SEARCH}"
    Wait Until Element Is Visible  ${BTN_SEARCH}  # aguarda até que o botão de pesquisa esteja visível
    Click Button  ${BTN_SEARCH}  # clica no botão de pesquisa
    Input Text  ${INPUT_SEARCH}  ${TEXT_SEARCH}  # insere o texto no campo de pesquisa
    Click Element  ${SUBMIT_SEARCH}  # clica no botão de submit da pesquisa

Verificar se o post foi pesquisado ao aparecer a mensagem "${MESSAGE_DISPLAYED}"
    Page Should Contain  ${MESSAGE_DISPLAYED}  # verifica se a mensagem foi exibida

Fechar o navegador
    Close Browser  # fecha o navegador

# fim das keywords do teste 01

# keywords do teste 02
Acessar o post "${POST_TITLE}"
    Pesquisar por um post com "${POST_TITLE}"  # chama a keyword Pesquisar por um post
    Click Link  ${POST_TITLE}  # clica no link do post
    Wait Until Element Is Visible  ${BTN_SEARCH}  # aguarda até que o botão de pesquisa esteja visível
    Title Should Be  ${POST_TITLE}  # verifica se o título da página é o título do post
 
Conferir se a imagem do robô aparece
    Page Should Contain Image  ${LOCATION_IMG_ROBO}  # verifica se a imagem do robô está presente na página

Conferir se o texto "${PIECE_OF_TEXT}" aparece
    Page Should Contain  ${PIECE_OF_TEXT}  # verifica se o texto está presente na página
# fim das kaywords do teste 02