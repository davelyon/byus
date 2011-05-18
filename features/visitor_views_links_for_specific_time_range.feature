Feature: Visitor views links for specific time range

  In order to more quickly browse links
  As a visitor on the bin show page
  I want to view links for a specific time range

  Background:
    Given 1 bin
    And "http://foobear-is-dead.cn" is 300 hours old
    And "http://foobears-are-scary.com" is 167 hours old
    And "http://foobears-are-ok.co.uk" is 47 hours old
    And "https://foobears-are-fubar.org" is 23 hours old

  Scenario: success
    When I am on the bin show page
    And I follow "1w"
    Then I should see "http://foobears-are-scary.com"
    And I should see "http://foobears-are-ok.co.uk"
    And I should see "https://foobears-are-fubar.org"
    And I should not see "http://foobear-is-dead.cn"

  Scenario: success
    When I am on the bin show page
    And I follow "48h"
    Then I should not see "http://foobears-are-scary.com"
    And I should see "http://foobears-are-ok.co.uk"
    And I should see "https://foobears-are-fubar.org"
    And I should not see "http://foobear-is-dead.cn"

  Scenario: success
    When I am on the bin show page
    And I follow "24h"
    Then I should not see "http://foobears-are-scary.com"
    And I should not see "http://foobears-are-ok.co.uk"
    And I should see "https://foobears-are-fubar.org"
    And I should not see "http://foobear-is-dead.cn"

  Scenario: public
    When I am on the public bin show page
    And I follow "48h"
    Then I should not see "http://foobears-are-scary.com"
    And I should see "http://foobears-are-ok.co.uk"
    And I should see "https://foobears-are-fubar.org"
    And I should not see "http://foobear-is-dead.cn"
