Feature: Método delete para deletar usuários

  Background:
    * url url

  @Regressivo
  Scenario: Deletar um usuário cadastrado
    * def id = call read('DeleteUsuario.feature@cadastrar')

    Given path '/usuarios/'+id.usuarioId
    When method Delete
    Then status 200
    And match response.message == "Registro excluído com sucesso"

    @ignore
    @cadastrar
    Scenario: Cadastrar para deletar
      * def now = function(){ return java.lang.System.currentTimeMillis()}
      * def email = 'caio'+now()+'@qa.com.br'
      * def body =
      """
      {
        "nome": "Caio Teste QA",
        "email": #(email),
        "password": "testeUsuario",
        "administrador": "true"
      }
      """
      Given  path '/usuarios'
      And request body
      When method Post
      Then status 201
      * def usuarioId = response._id
