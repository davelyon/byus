@javascript
Feature: Visitor views bin

  In order to more easilly share links
  As a visitor
  I want to view an already-created bin
  And I want to view truncated links

  Scenario: success
    Given 1 bin
    And that bin has the following links:
      | location                                                                         |
      | http://reddit.com/                                                               |
      | http://google.com/                                                               |
      | http://news.ycombinator.com/                                                     |
      | http://ooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo.com/foo |
    When I am on the bin show page
    Then I should see the bin hash
    And I should see the bin public link
    And I should see "http://reddit.com/" within the bins links
    And I should see "http://google.com/" within the bins links
    And I should see "http://news.ycombinator.com/" within the bins links
    And I should see "http://oooooooooooooooooooooooooooooooooooooooooooooooooo..." within the bins links

  Scenario: no links
    Given 1 bin
    When I am on the bin show page
    Then I should see "No links have been added recently!"
