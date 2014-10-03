Scenario: remove non-existing `ITEM` from cart
  Given I am on a cached version of the shopping cart page
    And my cart currently is empty
  When  I attempt to click the `REMOVE ITEM` button
  Then  an error notification should be shown
    And my cart should still be empty
