
Scenario: 1. Verify that allows creating a User.

Given I initialize story variable `URL` with value `https://petstore.swagger.io/v2`
When I initialise test user
When I set request headers
Given request body: ${user1}
When I execute HTTP POST request for resource with URL `${URL}/user`
Then response code is equal to `200`
Then content type of response body is equal to `application/json`
When I execute HTTP GET request for resource with URL `${URL}/user/${username}`
Then `${response}` matches `.+ttsson.+`

Scenario: 2. Verify that allows login as a User.

When I set request headers
When I execute HTTP GET request for resource with URL `${URL}/user/login?username=ttsson&password=test`
Then response code is equal to `200`
Then content type of response body is equal to `application/json`

Scenario: 3. Verify that allows creating the list of Users.

When I set request headers
When I initialise test users
When I execute HTTP POST request for resource with URL `${URL}/user/createWithList`
Then response code is equal to `200`
Then content type of response body is equal to `application/json`
When I execute HTTP GET request for resource with URL `${URL}/user/${username}`
Then `${response}` matches `.+ttsson2.+`

Scenario: 4. Verify that allows Log out User.

When I execute HTTP GET request for resource with URL `${URL}/user/logout`
Then response code is equal to `200`
Then content type of response body is equal to `application/json`

Scenario: 5. Verify that allows adding a new Pet

When I initialise test pet
When I set request headers
Given request body: ${pet}
When I execute HTTP POST request for resource with URL `${URL}/pet`
Then response code is equal to `200`
Then content type of response body is equal to `application/json`
When I execute HTTP GET request for resource with URL `${URL}/pet/${petId}`
Then `${response}` matches `.+Barsik.+`

Scenario: 6. Verify that allows updating Pet’s image

When I update petsImage
When I set request headers
Given request body: ${pet}
When I execute HTTP PUT request for resource with URL `${URL}/pet`
Then response code is equal to `200`
Then content type of response body is equal to `application/json`
When I execute HTTP GET request for resource with URL `${URL}/pet/${petId}`
Then `${response}` matches `.+2275950521.+`

Scenario: 7. Verify that allows updating Pet’s name and status

Given form data request:
|name     |value     |
|name     |Mursik    |
|status |unavailable |
When I execute HTTP POST request for resource with URL `${URL}/pet/${petId}`
Then response code is equal to `200`
Then content type of response body is equal to `application/json`
When I execute HTTP GET request for resource with URL `${URL}/pet/${petId}`
Then `${response}` matches `.+Mursik.+`

Scenario: 8. Verify that allows deleting Pet

When I set request headers
When I execute HTTP DELETE request for resource with URL `${URL}/pet/${petId}`
Then response code is equal to `200`
Then content type of response body is equal to `application/json`
When I execute HTTP GET request for resource with URL `${URL}/pet/${petId}`
Then response code is equal to `404`
