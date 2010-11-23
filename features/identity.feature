Feature: identities can manage works, series, bookmarks and recs

  Scenario: view identities
    Given an empty database
    When I am on the homepage
      And I follow "Identities"
    Then I should see "Identities"
      But I should not see "Identities" within "a"
      And I should see "Home" within "a"
      And I should see "There are no identities"
