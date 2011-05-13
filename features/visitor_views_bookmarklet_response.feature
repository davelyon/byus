Feature: Visitor views bookmarklet response

  In order to confirm my link has been added
  As a visitor on any other web page
  I want to see a response injected on the current page

  @javascript
  Scenario: success
    Given 1 bin
    When I am on the root page
    And I use the bookmarklet
    Then I should see "Link Saved" within ".byus_link_saver"
