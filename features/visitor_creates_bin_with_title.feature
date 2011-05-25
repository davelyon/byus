Feature: visitor creates bin

  Scenario: Success
    Given I am on the home page
    When I fill in "Location" with "Hashrocket"
    And I press "Create"
    Then I should be on the bin show page
    And I should see "Hashrocket" within the page title
