Scenario: add `ITEM` to cart
  Given I am on the product page for `ITEM` with `PRICE` of "$4.99"
    And my cart currently is empty with `SUBTOTAL` of "$0.00"
  When  I click `ADD TO CART`
  Then  my cart should contain "1" of `ITEM` with `SUBTOTAL` of "$4.99"

Scenario: add duplicate `ITEM` to cart
  Given I am on the product page for `ITEM` with `PRICE` of "$4.99"
    And my cart currently contains "1" of `ITEM` with `SUBTOTAL` of "$4.99"
  When  I click on the `ADD TO CART` button
  Then  my cart should contain "2" of `ITEM` with `SUBTOTAL` of "$9.98"

Scenario: remove `ITEM` from cart
  Given I am on the shopping cart page
    And my cart currently contains "1" of `ITEM`
  When  I click on the `REMOVE ITEM` button
  Then  my cart should be empty

Scenario: change quantity of `ITEM` in cart
  Given I am on the shopping cart page
    And my cart contains "1" of `ITEM` with `SUBTOTAL` of "$4.99"
  When  I click on the `CHANGE QUANTITY` button
    And I set the `QUANTITY` field to "2"
    And I click on the `UPDATE` button
  Then  my cart should contain "2" of `ITEM` with `SUBTOTAL` of "$9.98"

Scenario: open product page for `ITEM` from cart
  Given I am on the shopping cart page
    And my cart contains "1" of `ITEM`
  When  I click on the `ITEM` link
  Then  I should be shown the product page for `ITEM`

Scenario: calculate shipping cost estimate for cart
  Given I am on the shopping cart page
    And my cart contains "1" of `ITEM` with `WEIGHT` of "32oz"
  When  I click on the `ESTIMATE SHIPPING` button
    And set the `STREET ADDRESS #1` field to "200 W JACKSON BLVD"
    And set the `STREET ADDRESS #2` field to "ATTN: ENOVA INTERNATIONAL, INC."
    And set the `CITY` field to "CHICAGO"
    And set the `STATE` field to "IL"
    And set the `ZIP` field to "60606"
  Then  I should be shown an `ESTIMATED SHIPPING COST` of "$10.00"

Scenario: shopping cart retains state after logging in
  Given I am currently not logged in as a registered user
    And my cart contains "1" of `ITEM`
  When  I click on the `LOGIN` link
    And I set the `USERNAME` field to "testuser"
    And I set the `PASSWORD` field to "password1234"
    And I click on the `SUBMIT` button
  Then  I should be logged in as "testuser"
    And my cart should still contain "1" of `ITEM`

Scenario: shopping cart synchronizes state after logging in
  Given the "testuser" account has a cached cart with "1" of `ITEM-A`
    And I am currently not logged in as a registered user
    And my cart contains "1" of `ITEM-B`
  When  I click on the `LOGIN` link
    And I set the `USERNAME` field to "testuser"
    And I set the `PASSWORD` field to "password1234"
    And I click on the `SUBMIT` button
  Then  I should be logged in as "testuser"
    And my cart should contain "1" of `ITEM-A`
    And my cart should contain "1" of `ITEM-B`
