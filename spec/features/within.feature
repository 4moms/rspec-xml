@within
Feature: within should be able to accept block as arugment

  Background:
    Given there is a string of XML
    Given there are the following nodes:
      | node      | value  |
      | property1 | value1 |
      | property2 | value2 |

  Scenario: the matcher should pass when the nodes contains the text
    When I test for the following text within the corresponding nodes:
      | node      | text   |
      | property1 | value1 |
      | property2 | value2 |
    Then the test should pass

  Scenario: the matcher should fail when the node doesn't contain the text
    When I test for the following text within the corresponding nodes:
      | node      | text   |
      | property1 | value1 |
      | property2 | value9 |
    Then the test should fail

