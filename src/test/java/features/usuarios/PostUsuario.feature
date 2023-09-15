Feature: Método post para cadastrar usuários

  Background:
    * url url

    Scenario: Cadastrar usuário com sucesso com body no corpo do teste
      * def body =
      """
      {
        "nome": "Teste Usuário",
        "email": "testeusu@qa.com.br",
        "password": "testeUsuario",
        "administrador": "true"
      }
      """
      Given  path '/usuarios'
      And request body
      When method Post
      Then status 201
      And match response.message == 'Cadastro realizado com sucesso'

  @Regressivo
  Scenario: Cadastrar usuário com sucesso com body em arquivo
    * def now = function(){ return java.lang.System.currentTimeMillis()}

    * def body = read('classpath:/jsons/usuario.json')
    * set body.nome = 'Caio'
    * set body.email = 'caio'+now()+'@qa.com.br'
    * set body.password = '753951'
    * set body.administrador = 'false'

    Given  path '/usuarios'
    And request body
    When method Post
    Then status 201
    And match response.message == 'Cadastro realizado com sucesso'
    * def usuarioId = response._id