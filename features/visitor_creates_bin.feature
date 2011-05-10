Feature: visitor creates bin

In order to more easily share links
As a visitor on the byus home page
I want to create a bin

  Scenario: Success
    Given I am on the home page
    When I fill in "Enter a URL" with "http://hashrocket.com/"
    And I press "Create"
    Then I should be on the bin show page
    And I should see "http://hashrocket.com/" within "h1.page_title"

  Scenario: Failure
    Given I am on the home page
    When I fill in "link_location" with ""
    And I press "Create"
    Then I should be on the root page
    And I should see "Unable to add link" within "#flash > .error"
