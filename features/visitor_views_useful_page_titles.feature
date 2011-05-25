Feature: User views useful page titles

  Scenario: root
    Given I am on the root page
    Then I should see "this.isby.us : Make a Bin" within the title

  Scenario: bins/show
    Given the following bin:
      | title | Foobear |
    When I am on the bin show page
    Then I should see "this.isby.us : Foobear Bin" within the title

  Scenario: latest
    Given I am on the links latest page
    Then I should see "this.isby.us : Latest" within the title

  Scenario: bins
    Given I am on the root page
    And I press "Create"
    Then I should see "this.isby.us : Make a Bin" within the title

  Scenario: public/bin
    Given the following bin:
      | title | Publicity |
    When I am on the public bin show page
    Then I should see "this.isby.us : Publicity Bin" within the title
