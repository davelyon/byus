Feature: Visitor views RSS feed for links

  Background: 
    Given the following bin:
      | title | An RSS Bin |
    And that bin has the following links:
      | title                | location             |
      | The Google           | http://google.com/   |
      | http://facebook.com/ | http://facebook.com/ |

  Scenario: public
    When I am on the bin rss feed page
    Then I should see "An RSS Bin" within xml title
    And I should see "The Google"
    And I should see "http://google.com"
    And I should see "http://facebook.com/"
    And I should see "http://facebook.com/"

  Scenario: private
    When I am on the public bin rss feed page
    Then I should see "An RSS Bin" within xml title
    And I should see "The Google"
    And I should see "http://google.com"
    And I should see "http://facebook.com/"
    And I should see "http://facebook.com/"
