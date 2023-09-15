Feature: Metodo get para listar usuarios cadastrados

  Background:
    * url 'https://serverest.dev'

    Scenario: Listar usuarios cadastrados
      Given path '/usuarios'
      When  method Get
      Then status 200

    Scenario: Listar usuario por nome
      Given path '/usuarios'
      And param nome = 'Fulano da Silva'
      When  method Get
      Then status 200

  Scenario: Listar usuario por nome e email
    Given path '/usuarios'
    And params {nome: 'Fulano da Silva', email: 'fulano@qa.com'}
    When  method Get
    Then status 200


  Scenario: Listar usuario por nome e email validar o nome do usuario retornado
    Given path '/usuarios'
    And params {email: 'fulano@qa.com'}
    When  method Get
    Then status 200
    And match response.usuarios[0].nome == 'Fulano da Silva'

  Scenario: Listar usuario por nome e email validar o nome do usuario retornado errado
    Given path '/usuarios'
    And params {email: 'fulano@qa.com'}
    When  method Get
    Then status 200
    And match response.usuarios[0].nome == 'amandayoung'

  Scenario: Listar usuario e verificar se contem um usuário com nome Caio
    Given path '/usuarios'
    When  method Get
    Then status 200
    And match response.usuarios[*].nome contains 'Caio'

  Scenario: Listar usuario e verificar se contem um usuário com nome kevinwilliams
    Given path '/usuarios'
    When  method Get
    Then status 200
    And match response.usuarios[*].nome contains 'kevinwilliams'