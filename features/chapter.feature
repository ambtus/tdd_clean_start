Feature: works can have one or more chapters

  Scenario: single chaptered work
    Given an empty database
    When I am logged in
      And I follow "Manage works"
      And I fill in "Title" with "Fairy tails"
      And I fill in "Content" with "Once upon a time"
      And I press "Submit"
    Then I should see "Work successfully created"
    When I follow "Fairy tails"
    Then I should see "Once upon a time"

