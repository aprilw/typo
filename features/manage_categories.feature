Feature: Create and edit categories
  As a blog administrator
  In order to make my content easier to find
  I want to be able to create categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully create and edit a category
    Given I am on the new category page
    When I fill in "category_name" with "Fun"
    And I fill in "category_description" with "All about fun"
    And I press "Save"
    Then I should see "Fun"
    And I should see "All about fun"
    When I follow "Fun"
    And I fill in "category_name" with "Serious"
    And I press "Save"
    Then I should see "Serious"