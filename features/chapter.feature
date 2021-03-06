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

  Scenario: multi chaptered work
    Given an empty database
    When I am logged in
      And I follow "Manage works"
      And I fill in "Title" with "Great American Novel"
      And I fill in "Content" with "Once upon a time"
      And I check "Chaptered"
      And I press "Submit"
    Then I should see "Work successfully created"
    When I fill in "work_chapters_attributes_1_content" with "The next day"
      And I fill in "work_chapters_attributes_1_chapter_name" with "Day 2"
    And I press "Submit"
    Then I should see "Great American Novel updated"
    When I fill in "work_chapters_attributes_2_content" with "The day after that"
      And I fill in "work_chapters_attributes_2_chapter_name" with "Day 3"
      And I check "Complete"
      And I press "Submit"
    Then I should see "Your works"
    When I follow "Great American Novel"
      Then I should see "Once upon a time"
      But I should not see "The next day"
    When I follow "Next chapter"
    Then I should see "The next day"
