Feature: Works can be created by logged in people.

 Scenario: logged out users can't manage works
   When I am logged out
   Then I should not see "Manage works"

 Scenario: logged in users can manage works
   Given an empty database
   When I am logged in
     And I follow "Manage works"
   Then I should see "You have no works"
   When I follow "Add a new work"
     And I fill in "Title" with "My epic novel"
     And I press "Submit"
   Then I should see "Work successfully created"
     And I should see "Your works"
     And I should see "My epic novel"
