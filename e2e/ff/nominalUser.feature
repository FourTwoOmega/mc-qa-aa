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
        And I see that no other budget items were added
        And I see that "Total Inflow" <TIChangedOrNot>
        And I see that "Total Outflow" <TOChangedOrNot>
        And I see that the arithmetic of the Balance Section evaluates to true
        And I see that the sum of all budget items equals the "Working Balance"
        When I note the current budget items of the "Balance" section
        And I note the categories in use in the "Balance" section
        And I click on the "Reports" tab
        And I click on the "Inflow vs Outflow" report tab
        Then I see that the amount on the "Inflow" bar matches "Total Inflow" from the "Budget" tab
        And I see that the amount on the "Outflow" bar matches "Total Outflow" from the "Budget" tab
        And I see that the sum of the amounts in the "Outflow" categories match the amount on the "Outflow" bar
        And I see that the same outflow categories displayed as in the "Balance" section of the "Budget" tab
        And I see that each category's amount is the sum of all items in that category from the "Budget" tab
        But I do not see "Income" listed with the "Outflow" categories
        And I see that the amount for each category is the sum of all items in those categories from the "Budget" tab
        When I click on the "Spending by Category" report tab
        Then I see the same outflow categories displayed as in the "Balance" section of the "Budget" tab
        And I see that each category's amount is the sum of all items in that category from the "Budget" tab
        But I do not see the "Income" category
        When I click on the "Inflow vs Outflow" report tab
        Then I see that the amounts are the same as the last time I loaded the page
        When I click on the "Spending by Category" tab
        Then I see that the amounts are the same as the last time I loaded the page

        Examples:
            | Category  | Description                     | Value   | TIChangedOrNot | TOChangedOrNot |
            | Utensils  | Test 1: Outflow cat. not-in-use | 1.11    | did not change | changed        |
            | Income    | Test 2: Inflow                  | 22.22   | changed        | did not change |
            | Income    | Test 3: Inflow                  | 333.33  | changed        | did not change |
            | Groceries | Test 4: Outflow cat. in-use     | 4444.44 | did not change | changed        |
    
