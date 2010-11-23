Feature: Users can sign up, log in, manage identities, read restricted works, and have a reading history

  Scenario: sign up as a new user
    Given an empty database
    When I am on the homepage
    Then I should see "Welcome!"
      And I should see "Home"
      But I should not see "Home" within "a"
    When I follow "Sign up"
      And I fill in "Email" with "someone@example.com"
      And I fill in "Password" with "secret"
      And I fill in "Password confirmation" with "secret"
      And I press "Sign up"
    Then I should see "You have signed up successfully. A confirmation was sent to your e-mail."
    When I am on the homepage
      And I follow "Sign in"
      And I fill in "Email" with "someone@example.com"
      And I fill in "Password" with "secret"
      And I press "Sign in"
    Then I should see "You have to confirm your account before continuing."
      And I should not see "Signed in successfully."

  Scenario: log in and manage identities
    Given an empty database
    When I am logged in
    And I follow "Manage identities"
    Then I should see "You have no identities"
    When I follow "Add an identity"
      And I fill in "Name" with "Nom de Plume"
      And I press "Submit"
    Then I should see "Identity successfully created"
    When I follow "Nom de Plume"
    Then I should see "Nom de Plume"
    When I follow "Manage identities"
    Then I should not see "You have no identities"
      And I should see "Your identities"
      And I should see "Nom de Plume"
    When I am logged out
    Then I should not see "Manage identities"
