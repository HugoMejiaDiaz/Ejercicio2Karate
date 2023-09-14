Feature: Crear un nuevo usuario en signup

  Background:
    * url 'https://api.demoblaze.com'

  Scenario: Registrar un nuevo usuario con éxito
    Given path '/signup'
    Given request { username: 'jujujijo15', password: 'jujujijo15' }
    When method post
    Then status 200
    And eval if (response.errorMessage) karate.match(response.errorMessage, 'Sign up successful.')
  Scenario: Intentar crear un usuario ya existente
    Given path '/signup'
    Given request { username: 'Accel28', password: 'Accel289' }
    When method post
    Then status 200
    And match response == { errorMessage: 'This user already exist.' }
  Scenario: Inicio de sesión exitoso
    Given path '/login'
    Given request { username: 'Accel2dsadasdd8', password: 'Accel2dddd89' }
    When method post
    Then status 200
  Scenario:  Usuario y password incorrecto en login
    Given path '/login'
    Given request { username: 'Accel2dsadasdd854564', password: 'Accel2dddd8956456456' }
    When method post
    And match response == { errorMessage: 'User does not exist.' }


