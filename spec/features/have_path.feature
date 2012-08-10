Feature: "some xml".should have_xpath('//something').with_text('Budweiser') ---

  Background:
    Given there is a string of XML

  Scenario: the matcher should pass when the node contains the text
    Given the best node contains the text: Budweiser
    When I test for the text: Budweiser within the best node
    Then the test should pass

  Scenario: the matcher should fail when the node doesn't contain the text
    Given the best node contains the text: Budweiser
    When I test for the text: Miller within the best node
    Then the test should fail
