Feature: visitor creates bin

In order to more easily share links
As a visitor on the byus home page
I want to create a bin

  Scenario: Success
    Given I am on the home page
    When I fill in "bin_initial_link" with "http://hashrocket.com/"
    And I press "Create"
    Then I should be on the bin show page
