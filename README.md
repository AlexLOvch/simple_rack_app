# Simple rack app
Simple RACK app with ActiveRecord to store data
## Description
This simple RACK-based app creates JSON-API to process 3 requests only:

1. `POST /users` - Creates new user
>
> Input params:
` {
  "email": "john@example.com"
}`
>
> Email will to be checked on presence, uniqueness and email format
>
> Response example:
>
> `{
  "data": {
    "id": "2ea550bc-705c-4702-b6d0-831919a33e5c",
    "email": "john@example.com"
  }
}`
>
> Error response example:
>
> `{"data":"email_already_exists","message":["Email has already been taken"]}`

2. `GET /users` - responds with all users data
> Response example:
> `{
  "data": [
    {
      "id": "2ea550bc-705c-4702-b6d0-831919a33e5c",
      "email": "john@example.com"
    }
  ]
}`

3. `GET /users/:id` - responds with one user data or 404 if user not found
> Email will to be checked on presence, uniqueness and email format
>
> Response example:
> `{
  "data": {
    "id": "2ea550bc-705c-4702-b6d0-831919a33e5c",
    "email": "john@example.com"
  }
}`
>
> Not found response example:
> `{
"data":"user_not_found",
"message":"User not found"
}`

On other requests it will be responding with 404.

## Installation

1.  Clone this repo
2. `bundle`
3.  `bundle exec rackup --port 3000 --host 0.0.0.0`
