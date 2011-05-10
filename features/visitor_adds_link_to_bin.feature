Feature: Visitor adds link to bin

  In order to more easilly share links
  As a visitor on the bin show page
  I want to add a link

  Background:
    Given 1 bin
    And that bin has the following links:
      | location                     |
      | http://reddit.com/           |
      | http://google.com/           |
      | http://news.ycombinator.com/ |

  Scenario: Success
    When I am on the bin show page
    And I fill in "link[location]" with "http://facebook.com/"
    And I press "Add"
    Then I should see "Link Added" within "#flash > .success"
    And I should see "http://facebook.com/" within ".links"
    And I should see "http://reddit.com/" within ".links"
    And I should see "http://google.com/" within ".links"
    And I should see "http://news.ycombinator.com/" within ".links"

  Scenario: Failure
    When I am on the bin show page
    And I fill in "link[location]" with ""
    And I press "Add"
    Then I should be on the bin show page
    And I should see "Unable to add link" within "#flash > .error"
    And I should see "http://reddit.com/" within ".links"
    And I should see "http://google.com/" within ".links"
    And I should see "http://news.ycombinator.com/" within ".links"
