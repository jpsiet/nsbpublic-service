Feature: Testing Spring Boot REST API

  Scenario: Test GET /greet endpoint
    Given url 'http://localhost:8080/students'
    When method GET
    Then status 200
     And  match  response  ==
    """
    [{"id":1,"name":"John Doe","age":15,"grade":"10","email":"john.doe@example.com"},{"id":2,"name":"jitendra","age":15,"grade":"10","email":"john.doe@example.com"},{"id":3,"name":"John Doe","age":15,"grade":"10","email":"john.doe@example.com"},{"id":4,"name":"jitendra","age":15,"grade":"10","email":"john.doe@example.com"},{"id":5,"name":"John Doe","age":15,"grade":"10","email":"john.doe@example.com"},{"id":6,"name":"jitendra","age":15,"grade":"10","email":"john.doe@example.com"},{"id":21,"name":null,"age":0,"grade":null,"email":null}]
    """
    And match response contains deep {"id":1,"name":"John Doe","age":15,"grade":"10","email":"john.doe@example.com"}
   And match  header content-type == 'application/json'
    And match  response[0] == {"id":1,"name":"John Doe","age":15,"grade":"10","email":"john.doe@example.com"}
    #  match the  length
    And match response == '#[7]'


  Scenario: Test GET /greet endpoint  fuzzy matcher
    Given url 'http://localhost:8080/students'
    When method GET
    Then status 200
    And  match  response[0].id  ==  '#notnull'

  Scenario: Test GET /greet endpoint  fuzzy matcher regex
    Given url 'http://localhost:8080/students'
    When method GET
    Then status 200
    And  match  response[0].id  ==  '#? _ >=1'
    # name should be string and  length mst be grt than 2
    And  match  response[0].name  ==  '#string?  _.length >=2'
