Feature: identities can own works, series, bookmarks and recs

  Scenario: view identities
    Given an empty database
    When I am on the homepage
      And I follow "Identities"
    Then I should see "Identities"
      But I should not see "Identities" within "a"
      And I should see "Home" within "a"
      And I should see "There are no identities"

    Given there is an identity "Nom de Plume"
    When I am on the homepage
      And I follow "Identities"
    Then I should not see "There are no identities"
    When I follow "Nom de Plume"
    Then I should see "Nom de Plume"
      And I should see "Home" within "a"

    Given there is an identity "Pen Name"
    When I follow "Identities"
    Then I should see "Pen Name"
      And I should see "Nom de Plume"
