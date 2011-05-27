Feature: Visitor clicks bookmarklet link in bin

  @javascript
  Scenario: success
    Given 1 bin
    And I am on the bin show page
    When I follow "Bookmarklet" within "#bin_controls"
    Then I should see "Drag" within "#bookmarklet_helper"
