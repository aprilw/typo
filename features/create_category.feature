Feature: Create category
  As a blog administrator
  In order to make my content easier to find
  I want to be able to create categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully create a category
    Given I am on the new category page
