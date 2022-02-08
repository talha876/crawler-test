# Proxy Crawler

- Run the following commands after cloning application locally:

  - `rails db:create`
  - `rails db:migrate`
  - `rails db:seed`
  - `sidekiq`
  - `redis-server`
  - `bundle install`

- Please also create `.env.development` file and copy env variables from `.env.development.copy` and add your own values against each variable

- After that run `rails server`

You can add new Amazon URLs for crawling by updating seeds.rb file.

For Authentication, the api link is:

`http://localhost:3000/authenticate`

```sh
{
	"email": "admin@email.com",
	"password": "admin1234"
}
```

For fetching products, please include the Auth Token received in the previous API.
