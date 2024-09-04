

!--Feature: epam page verification

Scenario: 1. Check the title is correct.

Given I am on page with URL `https://www.epam.com`
Then page title is equal to `EPAM | Software Engineering & Product Development Services`
When I close browser

Scenario: 2. Switch language to UA.

Given I am on page with URL `https://www.epam.com`
When I click on element located by `xpath(//*[@id="wrapper"]/div[2]/div[1]/header/div/div/ul/li[2]/div/div/button/span)`
Then number of elements found by `xpath(//*[@id="wrapper"]/div[2]/div[1]/header/div/div/ul/li[2]/div/nav/strong):a` is equal to `1`
When I click on element located by `xpath((//*[@id="wrapper"]/div[2]/div[1]/header/div/div/ul/li[2]/div/nav/ul/li[6]))`
Then the page with the URL containing 'ua' is loaded
When I close browser

Scenario: 3. Check the ability to switch Light / Dark mode.

Given I am on page with URL `https://www.epam.com`
When I change context to element located by `xpath(//*[@id="wrapper"]/div[2]/div[1]/header/div)`
Then context element has CSS property `color` with value that is equal to `rgba(35, 31, 32, 1)`
When I click on element located by `xpath(//*[@id="wrapper"]/div[2]/div[1]/header/div/div/div[2]/section/div)`
Then context element has CSS property `color` with value that is equal to `rgba(0, 0, 0, 1)`
When I close browser

Scenario: 4. Check the policies list.

Given I am on page with URL `https://www.epam.com`
Then number of elements found by `xpath(//*[@id="wrapper"]/div[3]/div[1]/footer/div/div/div[1]/div[2]/h2)` is = `1`
When I save `text` attribute value of element located by `xpath(//ul[contains(@class, 'policies')]/li/a)->filter.index(<index>)` to scenario variable `actualValue`
Then `${actualValue}` is equal to `<expectedValue>`
Examples:
|index|expectedValue           |
|1    |INVESTORS               |
|2    |OPEN SOURCE             |
|3    |PRIVACY POLICY          |
|5    |COOKIE POLICY           |
|6    |APPLICANT PRIVACY NOTICE|
|7    |WEB ACCESSIBILITY       |

Scenario: 5. Check that allow to switch location list by region.

Given I am on page with URL `https://www.epam.com`
Then number of elements found by `xpath(//div[contains(@class, 'js-tabs-controls')]//a)` is = `3`
When I save `text` attribute value of element located by `xpath(//div[contains(@class, 'js-tabs-controls')]//a)->filter.index(<index>)` to scenario variable `actualValue`
Then `${actualValue}` is equal to `<expectedValue>`
When I click on element located by `xpath(//div[contains(@class, 'js-tabs-controls')]//a[text()='AMERICAS'])`
Then number of elements found by `xpath((//div[@class='locations-viewer-23__country-title list' and text()='Canada'])[2])` is = `1`
When I click on element located by `xpath(//div[contains(@class, 'js-tabs-controls')]//a[text()='EMEA'])`
Then number of elements found by `xpath(//div[@class='locations-viewer-23__country-title list' and text()='Armenia'])` is = `2`
When I click on element located by `xpath(//div[contains(@class, 'js-tabs-controls')]//a[text()='APAC'])`
Then number of elements found by `xpath(//div[@class='locations-viewer-23__country-title list' and text()='Australia'])` is = `2`
Examples:
|index|expectedValue|
|1    |AMERICAS     |
|2    |EMEA         |
|3    |APAC         |

Scenario: 6. Check the search function.

Given I am on page with URL `https://www.epam.com`
When I click on element located by `xpath(//div[1]/ul[1]/li[3]/div[1]/button[1]/span[1])`
When I enter `AI` in field located by `xpath(//input[@id='new_form_search'])`
When I click on element located by `xpath(//*[@id="wrapper"]//header//form/div[1]/button)`
Then number of elements found by `xpath(//h2[contains(text(),'results for "AI"')])` is = `1`

Scenario: 7. Check form's fields validation.

Given I am on page with URL `https://www.epam.com/about/who-we-are/contact`
Then number of elements found by `xpath(//label[contains(text(),'*')])` is = `7`
When I click on element located by `xpath(//div[1]/div[2]/section[1]//div[1]/form[1]//button[1])`
Then I verify mandatory fields on Ask Us Anything page

Scenario: 8. Check that the Company logo on the header lead to the main page Steps.

Given I am on page with URL `https://www.epam.com/about/`
When I click on element located by `xpath(//header/div[1]/div[1]/div[2]/div[1]/a[1])`
Then `${current-page-url}` is equal to `https://www.epam.com/`

Scenario: 9. Check that allows to download report.

Given I am on page with URL `https://www.epam.com/about/`
Then number of elements found by `xpath(//div[@class='text-ui-23']/p/span/span[contains(text(), 'EPAM at')])` is = `1`
When I click on element located by `xpath(//header/div[1]/div[1]/div[2]/div[1]/a[1])`
