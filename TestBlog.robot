*** Settings ***
Resource  ResourceBlog.robot
Test Setup  Acessar a página do blog  # Executa essa keyword antes de cada caso de teste
Test Teardown  Fechar o navegador  # Executa essa keyword depois de cada caso de teste

*** Test Cases ***

Caso de Teste 01: Pesquisar um post
    Pesquisar por um post com "Novo Curso: Robot Framework com Playwright e GitHub Actions"
    Verificar se o post foi pesquisado ao aparecer a mensagem "Mostrando postagens que correspondem à pesquisa por Novo Curso: Robot Framework com Playwright e GitHub Actions"
    Fechar o navegador

Caso de Teste 02: Ler um post
    Acessar o post "Novo Curso: Robot Framework com Playwright e GitHub Actions"
    Conferir se a imagem do robô aparece
    Conferir se o texto "O curso básico foi atualizado com conteúdo regravado em 2023!" aparece
    Fechar o navegador