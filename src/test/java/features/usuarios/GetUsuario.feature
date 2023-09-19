Feature: Método Get para listar usuários cadastrados

  Background:
    * url url

  @Regressivo
  Scenario: Listar usuários cadastrados
    Given path '/usuarios'
    When  method Get
    Then status 200

  @Regressivo
  Scenario: Listar usuário por nome
    Given path '/usuarios'
    And param nome = 'Fulano da Silva'
    When  method Get
    Then status 200

  @smoke
  Scenario: Listar usuário por nome e email
    Given path '/usuarios'
    And params {nome: 'Fulano da Silva', email: 'fulano@qa.com'}
    When  method Get
    Then status 200

  @Regressivo
  Scenario: Listar usuário por nome e email. E validar o nome do usuário retornado
    Given path '/usuarios'
    And params {email: 'fulano@qa.com'}
    When  method Get
    Then status 200
    And match response.usuarios[0].nome == 'Fulano da Silva'

  @Regressivo
  Scenario: Listar usuario e verificar se contem um usuário com nome Caio
    Given path '/usuarios'
    When  method Get
    Then status 200
    And match response.usuarios[*].nome contains 'Caio'

  @Regressivo
  Scenario: Listar usuario e verificar se contem um usuário com nome Marison Cesar
    Given path '/usuarios'
    When  method Get
    Then status 200
    And match response.usuarios[*].nome contains 'Marison Cesar'

  @Regressivo
  Scenario: Verificar o conteúdo do response
    Given path '/usuarios'
    When  method Get
    Then status 200
    And match response.quantidade != '#null'
    And match response.quantidade == '#number'
    #And match response.quantidade == 48