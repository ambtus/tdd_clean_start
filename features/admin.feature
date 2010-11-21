Feature: bring up a new application

  Scenario: first log in
    Given an empty database
    When I am on the homepage
    Then I should see "Welcome!"
      And I should see "Home"
      But I should not see "Home" within "a"

    Given the seeds are loaded
    When I follow "Admin login"
