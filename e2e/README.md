# Test Plan for Budgeting Sample App

The objective of this test plan is to outline how the Budgeting Sample App will be tested and what will be required to accomplish this.

## Scope

User-based testing will be performed, meaning that the tests will simulate user actions on product webpages only. White box testing is outside the scope of this test plan.

Both mobile and desktop resolutions will be tested. Mobile resolutions are currently all widths 767 pixels and under. Desktop resolutions are currently all widths 768 pixels and above. The browser width will be configurable, and all tests will run as close to the same way as possible in both resolutions.

Input testing will only be performed with characters commonly accessible on US keyboards and will not include characters from other languages at this time.

Since this is a test application and added budget items do not persist after a refresh, persistence of data between sessions will not be tested.

## Automated Testing Framework

The testing framework will utilize WebdriverIO (http://webdriver.io/) to interact with the browser. The tests will be written in Node.js (ES6).

## Platforms Tested

All browsers and platforms are fully patched unless otherwise specified.

| Operating System | Browser   | Resolution |
| ---------------- | --------- | ---------- |
| Windows 10       | Chrome 63 | Mobile     |
| Windows 10       | Chrome 63 | Desktop    |
| Ubuntu 16.04 LTS | Chrome 63 | Mobile     |
| Ubuntu 16.04 LTS | Chrome 63 | Desktop    |

## Unit Testable Items

This section will not be expanded further because it is outside of the scope of the assignment and would add a very significant amount of time it takes to complete this document. Each of the bullets in this section would likely have its own section, and input field error testing would be outlined in these sections, as well.

* Budget Tab
  * Budget Section
    * Category
    * Description
    * Amount
  * Balance Section
    * Total Inflow
    * Total Outflow
    * Working Balance
* Reports Tab
  * Inflow vs Outflow Graph
  * Spending by Category Graph

## Integration Test Scenarios

The 3 test cases preceded by an asterisk contained in square brackets ([*]) have been selected to be implemented.

Data entered for tests will be cleared after each test by refreshing the page.

### Passing Criteria

The following passing criteria are to be evaluated at the end of each integration test.

1. Each budget item is added exactly once.
2. Each added budget item's Category is exactly as the user entered.
3. Each added budget item's Description is exactly as the user entered.
4. Each added budget item's Amount is exactly as the user entered.
5. No budget items were added that the user did not enter.
6. The Balance section updates to reflect the amount of all added budget items.
7. The math in the Balance section evaluates accurately.
8. The Inflow vs Outflow Report shows the same amount for Income as Total Inflow in the Balance section of the Budget tab.
9. The Inflow vs Outflow Report shows all Categories displayed that have been entered by the user on the Budget tab.
10. The Inflow vs Outflow Report does not show Income with the rest of the other categories.
11. The Inflow vs Outflow Report shows totals for each category that evaluate to the sum of all budget items in that category as displayed in the Budget section on the Budget tab.
12. The Spending by Category Report does not show Income.
13. The Spending by Category Report shows all Categories displayed that have been entered by the user on the Budget tab.
14. The Spending by Category Report shows totals for each category that evaluate to the sum of all budget items in that category as displayed in the Budget section on the Budget tab.
15. All budget items entered by the user on the Budget tab persist when switching to another tab and returning to the Budget tab.

### Nominal User Interaction for Adding Budget Items

This test suite is for testing the user perfectly entering the intended input; this table outlines permutations of scenarios.

| Outflow/Inflow       | Num. Items | Category already in Use |
| -------------------- | ---------: | ----------------------- |
| Outflow              | 1          | Yes                     |
| Outflow              | 2          | No                      |
| Outflow              | 3          | 2 Yes, 1 No             |
| Inflow               | 2          | N/A                     |
| [*] In, Out, Out, In | 4          | N/A, No, Yes, N/A       |

### Imperfect User Test Cases for Adding Budget Items

This test suite is to test what happens when the user either enters invalid input or changes their mind after information is entered. Each scenario describes where the user deviates from nominal behavior before proceeding to finish adding a budget item. If not otherwise specified, passing criteria is identical to that of the Nominal User Interaction test cases.

#### Order User Completes Fields is Irrelevant

1. User enters Category, Amount, then Description
2. [*] User enters Description, Category, then Amount
3. User enters Description, Amount, then Category
4. User enters Amount, Category, Description
5. User enters Amount, Description, Category

#### User Changing Field is Irrelevant

1. User enters Category, changes Category
2. User enters Category and Description, then changes Category
3. [*] User enters Category and Amount, then changes Category
4. User enters all information, then changes Category
5. User enters Description, changes Description
6. User enters Description and Category, then changes Description
7. User enters Description and Amount, then changes Description
8. User enters all information, then changes Description
9. User enters Amount, then changes Amount
10. User enters Amount and Category, then changes Amount
11. User enters Amount and Description, then changes Amount
12. User enters all information, then changes Amount
