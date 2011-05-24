
Feature: Visitor views bin

  In order to more easilly share links
  As a visitor
  I want to view an already-created bin
  And I want to view truncated links

  Scenario: success
    Given 1 bin
    And that bin has the following links:
      | location           | title              |
      | http://reddit.com/ | The Reddit         |
      | http://google.com/ | http://google.com/ |
    When I am on the bin show page
    Then I should see the bin hash
    And I should see the bin public link
    And I should see "The Reddit" within ".links"
    And I should see "http://google.com/" within ".links"
