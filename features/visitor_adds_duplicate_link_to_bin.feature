Feature: Visitor adds duplicate link to bin

  In order to more easily view my links
  As a visitor on the bin show page
  I want to not see duplicated links

  Background:
    Given 1 bin
    And that bin has the following links:
      | location                     |
      | http://reddit.com/           |
      | http://google.com/           |
      | http://news.ycombinator.com/ |

  Scenario: Success
    When I am on the bin show page
    And I fill in "link[location]" with "http://reddit.com/"
    And I press "Add"
    Then I should see "Unable to add link" within "#flash > .error"
    And I should see the link "http://reddit.com/" 1 time
