
Scenario: 1. Verify that allows register a User

Given I am on page with URL `https://demowebshop.tricentis.com/`
When I click on element located by `xpath(//a[contains(text(),'Register')])`
Then the page with the URL containing 'register' is loaded
When I generate data for user
When I click on element located by `xpath(//input[@id='gender-male'])`
When I change context to element located by `xpath(//input[@id='FirstName'])`
When I enter `${firstName}` in field located by `xpath(//input[@id='FirstName'])`
When I change context to element located by `xpath(//input[@id='LastName'])`
When I enter `${lastName}` in field located by `xpath(//input[@id='LastName'])`
When I change context to element located by `xpath(//input[@id='Email'])`
When I enter `${email}` in field located by `xpath(//input[@id='Email'])`
When I change context to element located by `xpath(//input[@id='Password'])`
When I enter `${password}` in field located by `xpath(//input[@id='Password'])`
When I change context to element located by `xpath(//input[@id='ConfirmPassword'])`
When I enter `${password}` in field located by `xpath(//input[@id='ConfirmPassword'])`
When I click on element located by `xpath(//input[@id='register-button'])`
Then number of elements found by `xpath(//div[contains(text(),'Your registration completed')])` is equal to `1`
Then the page with the URL containing 'registerresult' is loaded
When I click on element located by `xpath(//a[contains(text(),'Log out')])`

Scenario: 2. Verify that allows login a User

Given I am on page with URL `https://demowebshop.tricentis.com/`
When I click on element located by `xpath(//a[contains(text(),'Log in')])`
Then number of elements found by `xpath(//h1[contains(text(),'Welcome, Please Sign In!')])` is equal to `1`
When I change context to element located by `xpath(//input[@id='Email'])`
When I enter `${email}` in field located by `xpath(//input[@id='Email'])`
When I change context to element located by `xpath(//input[@id='Password'])`
When I enter `${password}` in field located by `xpath(//input[@id='Password'])`
When I click on element located by `xpath(//input[@class='button-1 login-button' and @type='submit' and @value='Log in'])`
Then number of elements found by `xpath(//a[contains(text(),'${email}')])` is equal to `1`
Then number of elements found by `xpath(//a[contains(text(),'Log out')])` is equal to `1`

Scenario: 3. Verify that Computers group has 3 sub-groups with correct names

Given I am on page with URL `https://demowebshop.tricentis.com/`
When I hover mouse over element located by `xpath(//body/div[4]/div[1]/div[2]/ul[1]/li[2])`
When I save `text` attribute value of element located by `xpath(//body/div[4]/div[1]/div[2]/ul[1]/li[2]/ul[1]/li/a)->filter.index(<index>)` to scenario variable `actualValue`
Then `${actualValue}` is equal to `<expectedValue>`
Examples:
|index|expectedValue           |
|1    |Desktops                |
|2    |Notebooks               |
|3    |Accessories             |

Scenario: 4. Verify that allows sorting items

Given I am on page with URL `https://demowebshop.tricentis.com/accessories`
Then dropdown located by `xpath(//select[@id='products-orderby'])` contains options:
|state|item              |
|true |Position          |
|false|Name: A to Z      |
|false|Name: Z to A      |
|false|Price: Low to High|
|false|Price: High to Low|
|false|Created on        |
When I select `Name: A to Z` in dropdown located by `xpath(//select[@id='products-orderby'])`
Then elements located by `xpath(//div[@class='product-grid']/div[@class='item-box'])` are sorted by text in ASCENDING order
When I select `Name: Z to A` in dropdown located by `xpath(//select[@id='products-orderby'])`
Then elements located by `xpath(//div[@class='product-grid']/div[@class='item-box'])` are sorted by text in DESCENDING order

Scenario: 5. Verify that allows changing number of items on page

Given I am on page with URL `https://demowebshop.tricentis.com/accessories`
Then dropdown located by `xpath(//select[@id='products-pagesize'])` contains options:
|state|item|
|false |4  |
|true  |8  |
|false |12 |
When I select `4` in dropdown located by `xpath(//select[@id='products-pagesize'])`
Then number of elements found by `xpath(//div[@class='product-grid']/div[@class='item-box'])` is equal to `4`

Scenario: 6. Verify that allows adding an item to the Wishlist

Given I am on page with URL `https://demowebshop.tricentis.com/apparel-shoes`
When I click on element located by `xpath(//div[contains(@class,'product-item')][.//h2[@class='product-title']/a[contains(text(),'Rockabilly Polka')]])`
Then number of elements found by `xpath(//h1[contains(text(),"50's Rockabilly Polka Dot Top JR Plus Size")])` is equal to `1`
When I click on element located by `xpath(//input[@id='add-to-wishlist-button-5'])`
Then number of elements found by `xpath(//div[@id='bar-notification'])` is equal to `1`
When I click on element located by `xpath(//span[contains(text(),'Wishlist')])`
Then number of elements found by `xpath(//h1[contains(text(),'Wishlist')])` is equal to `1`
Then number of elements found by `xpath(//a[contains(text(),"50's Rockabilly Polka Dot Top JR Plus Size")])` is equal to `1`

Scenario: 7. Verify that allows adding an item to the card

Given I am on page with URL `https://demowebshop.tricentis.com/apparel-shoes`
When I click on element located by `xpath(//div[contains(@class,'product-item')][.//h2[@class='product-title']/a[contains(text(),'Rockabilly Polka')]])`
Then number of elements found by `xpath(//h1[contains(text(),"50's Rockabilly Polka Dot Top JR Plus Size")])` is equal to `1`
When I click on element located by `xpath(//input[@id='add-to-cart-button-5'])`
Then number of elements found by `xpath(//div[@id='bar-notification'])` is equal to `1`
When I click on element located by `xpath(//span[contains(text(),'Shopping cart')])`
Then number of elements found by `xpath(//h1[contains(text(),'Shopping cart')])` is equal to `1`
Then number of elements found by `xpath(//tbody//a[@class='product-name' and contains(text(), "50's Rockabilly Polka Dot Top JR Plus Size")])` is equal to `1`

Scenario: 8. Verify that allows removing an item from the card

Given I am on page with URL `https://demowebshop.tricentis.com/cart`
Then number of elements found by `xpath(//tbody//a[@class='product-name' and contains(text(), "50's Rockabilly Polka Dot Top JR Plus Size")])` is equal to `1`
When I click on element located by `xpath(//tbody/tr[1]/td[1]/input[1])`
When I click on element located by `xpath(//input[@value='Update shopping cart'])`
Then number of elements found by `xpath(//tbody//a[@class='product-name' and contains(text(), "50's Rockabilly Polka Dot Top JR Plus Size")])` is equal to `0`

Scenario: 9. •	Verify that allows checkout an item

Given I am on page with URL `https://demowebshop.tricentis.com/apparel-shoes`
When I click on element located by `xpath(//div[contains(@class,'product-item')][.//h2[@class='product-title']/a[contains(text(),'Rockabilly Polka')]])`
Then number of elements found by `xpath(//h1[contains(text(),"50's Rockabilly Polka Dot Top JR Plus Size")])` is equal to `1`
When I click on element located by `xpath(//input[@id='add-to-cart-button-5'])`
Then number of elements found by `xpath(//div[@id='bar-notification'])` is equal to `1`
When I click on element located by `xpath(//span[contains(text(),'Shopping cart')])`
Then number of elements found by `xpath(//h1[contains(text(),'Shopping cart')])` is equal to `1`
When I click on element located by `xpath(//input[@id='termsofservice'])`
When I click on element located by `xpath(//button[@id='checkout'])`
When I select `United States` in dropdown located by `xpath(//select[@id='BillingNewAddress_CountryId'])`
When I change context to element located by `xpath(//input[@id='BillingNewAddress_City'])`
When I enter `${city}` in field located by `xpath(//input[@id='BillingNewAddress_City'])`
When I change context to element located by `xpath(//input[@id='BillingNewAddress_Address1'])`
When I enter `${Address 1}` in field located by `xpath(//input[@id='BillingNewAddress_Address1'])`
When I change context to element located by `xpath(//input[@id='BillingNewAddress_ZipPostalCode'])`
When I enter `${zip}` in field located by `xpath(//input[@id='BillingNewAddress_ZipPostalCode'])`
When I change context to element located by `xpath(//input[@id='BillingNewAddress_PhoneNumber'])`
When I enter `${phone}` in field located by `xpath(//input[@id='BillingNewAddress_PhoneNumber'])`
When I click on element located by `xpath(//*[@id="billing-buttons-container"]/input)`
When I click on element located by `xpath(//*[@id="shipping-buttons-container"]/input)`
When I click on element located by `xpath(//*[@id="shipping-method-buttons-container"]/input)`
When I click on element located by `xpath(//*[@id="payment-method-buttons-container"]/input)`
When I click on element located by `xpath(//*[@id="payment-info-buttons-container"]/input)`
When I click on element located by `xpath(//*[@id="confirm-order-buttons-container"]/input)`
Then number of elements found by `xpath(//h1[contains(text(),'Thank you')])` is equal to `1`
