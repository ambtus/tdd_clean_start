Feature: Admins can log in and manage users

  Scenario: first time login
    Given an empty database
      And the seeds are loaded
    When I am on the homepage
    Then I should see "Welcome!"
      And I should see "Home"
      But I should not see "Home" within "a"
    When I follow "First time login"
    Then I should see "Change your password"
    When I fill in "Password" with "secret"
      And I fill in "Password confirmation" with "secret"
      And I press "Change my password"
    Then I should see "Your password was changed successfully. You are now signed in."
      And I should not see "Admin login"
      But I should see "Manage account"
    When I follow "Set your email address"
    Then I should see "Edit Admin"
    When I fill in "Email" with "real@example.com"
    And I fill in "Current password" with "secret"
    And I press "Update"
    Then I should see "You updated your account successfully."

  Scenario: manage an admin

  Scenario: manage a user
