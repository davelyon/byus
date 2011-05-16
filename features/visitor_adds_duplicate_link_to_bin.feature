Feature: Visitor adds duplicate link to bin

  In order to more easily view my links
  As a visitor on the bin show page
  I want to push duplicated links to the top of the page
  And I do not want actual duplication

  Background:
    Given 1 bin
    And that bin has the following links:
      | location                     |
      | http://reddit.com/           |
      | http://google.com/           |
      | http://news.ycombinator.com/ |

  Scenario: Success
    When I am on the bin show page
    And I fill in "Location" with "http://google.com/"
    And I press "Add"
    Then I should see "http://google.com/" in link position 1
    And I should see the link "http://google.com/" 1 time
