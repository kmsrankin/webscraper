# GitHub Web Scraper

This project is an exercise in web scraping using the Nokogiri library to crawl the GitHub weekly trending page, display the trending repositories, seed a database, and construct an API endpoint. It currently consists of a rails backend and a command line interface.

The following is a list of instructions for using and testing this program:

* install dependencies (required)
  - `$bundle install`

create, build, and seed the database (required)
  create - `$bundle exec rake db:create`
  build - `$bundle exec rake db:migrate`
  seed - `$rake fetch_and_seed`

* How to view trending repositories in your terminal
  - `$rake fetch_trending_repositories`

* How to access the API endpoint
  - `$rails s`
  - navigate to "https://localhost:3000/api/v1/repositories"

* Run model tests
  - `$bundle exec rspec`
