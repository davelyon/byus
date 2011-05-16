Feature: visitor creates bin

In order to more easily share links
As a visitor on the byus home page
I want to create a bin

  Scenario: Success
    Given I am on the home page
    When I fill in "Location" with "http://hashrocket.com/"
    And I press "Create"
    Then I should be on the bin show page
    And I should see "http://hashrocket.com/" within "h1.page_title"

  Scenario: Failure
    Given I am on the home page
    When I fill in "Location" with ""
    And I press "Create"
    Then I should see "Unable to create a new bin" within "#flash > .error"
