@javascript
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
    And I fill in "Location" with "http://facebook.com/"
    And I press "Add"
    Then I should see "Link Added" within the success flash
    And I should see "http://facebook.com/" within the bins links
    And I should see "http://reddit.com/" within the bins links
    And I should see "http://google.com/" within the bins links
    And I should see "http://news.ycombinator.com/" within the bins links

  Scenario: Blank URL
    When I am on the bin show page
    And I fill in "Location" with ""
    And I press "Add"
    Then I should be on the bin show page
    And I should see "Unable to add link" within the error flash
    And I should see "can't be blank"
    And I should see "http://reddit.com/" within the bins links
    And I should see "http://google.com/" within the bins links
    And I should see "http://news.ycombinator.com/" within the bins links

  Scenario: Bad URL
    When I am on the bin show page
    And I fill in "Location" with "foobear lives!"
    And I press "Add"
    Then I should be on the bin show page
    And I should see "Unable to add link" within the error flash
    And I should see "should be like http://example.com"
    And I should see "http://reddit.com/" within the bins links
    And I should see "http://google.com/" within the bins links
    And I should see "http://news.ycombinator.com/" within the bins links
