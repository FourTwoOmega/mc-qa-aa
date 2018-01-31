@integration @nominal @happypath
Feature: The entering of budget items under nominal circumstances
    In order to test the entering of budget items
    As an end-user
    I will test as though the user has perfect knowledge of the product

    Background:
        Given I am on the "Budget" tab
        # TODO: Decide whether to store the values before navigating away from each page
        And I note the number of budget items currently displayed
        And I note the current values of the "Balance" section

    @outflow @wip
    Scenario: User perfectly enters 1 outflow budget item from category already in use


    @outflow @wip
    Scenario Outline: User perfectly enters 2 outflow budget items from categories not already in use


    @outflow @wip
    Scenario Outline: User perfectly enters 3 outflow budget items: 2 from cateories already in use, and 1 not


    @inflow @wip
    Scenario Outline: User perfectly enters 2 inflow budget items
    

    @outflow @inflow @assignment @wip
    Scenario Outline: User enters 4 budget items: inflow, outflow from not-in-use category, outflow from in-use category, inflow
        Given I want to enter a budget item with the following parameters:
            | <Category> | <Description> | <Value> |
        When I select the <Category> category
        And I enter <Description> in the Description field
        And I enter <Value> in the Value field
        And I click the "Add" button
        Then I see the budget item with the following parameters was entered exactly once:
            | <Category> | <Description> | <Value> |

        Examples:
            | Category  | Description                     | Value   | TIChangedOrNot | TOChangedOrNot |
            | Utensils  | Test 1: Outflow cat. not-in-use | 1.11    | did not change | changed        |
            | Income    | Test 2: Inflow                  | 22.22   | changed        | did not change |
            | Income    | Test 3: Inflow                  | 333.33  | changed        | did not change |
            | Groceries | Test 4: Outflow cat. in-use     | 4444.44 | did not change | changed        |
    
