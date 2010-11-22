Feature: Users can log in, manage pseuds, read restricted works, and have a reading history

  Scenario: sign up new user
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

  Scenario: log in and create a pseud
    Given an empty database
    When I am logged in
    And I follow "Manage pseuds"
