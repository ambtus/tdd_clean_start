Feature: Works can be created by logged in people and browsed by identity

 Scenario: logged out users can't manage works
   When I am logged out
   Then I should not see "Manage works"
   When I go to the edit works page
   Then I should see "You need to sign in or sign up before continuing."

  Scenario: users can create works which can be browsed through identities
    Given an empty database
    When I am logged in
      And I have an identity "Nom de Plume"
      And I follow "Manage works"
    Then I should see "You have no works"
      And I fill in "Title" with "My epic novel"
      And I press "Submit"
    Then I should see "Work successfully created"
    When I select "Nom de Plume" from "by"
      And I press "Submit"
    Then I should see "My epic novel updated"
    When I follow "Identities"
      And I follow "Nom de Plume"
    Then I should see "My epic novel"
    When I follow "Manage works"
      And I select "" from "by"
      And I press "Submit"
     Then I should see "My epic novel updated"
    When I follow "Identities"
      And I follow "Nom de Plume"
    Then I should not see "My epic novel"
