# README
    * I used ruby version 2.4.5 on the rails framework to build this project. This program relies heavily on the Nokogiri library to crawl the gitHub weekly trending page and retrieve information.

    The following is a list of instructions for using and testing this program:

      * install dependencies (required)
        - $bundle install

      * create, build, and seed the database (required)
        create - $bundle exec rake db:create
        build - $bundle exec rake db:migrate
        seed - $rake fetch_and_seed

      * How to test completion of part 1
        - $rake fetch_trending_repositories

      * How to access the API endpoint
        - $rails s
        - navigate to "https://localhost:3000/api/v1/repositories"

      * Run model tests
        - bundle exec rspec
