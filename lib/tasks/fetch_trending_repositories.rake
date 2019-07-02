desc "Fetch weekly trending repositories from github"
task :fetch_trending_repositories => :environment do

  require 'nokogiri'
  require 'open-uri'

  TRENDING_URL = 'https://github.com/trending?since=weekly'
  JAVASCRIPT_ONLY_URL = 'https://github.com/trending/javascript?since=weekly'
  UNSPECIFIED_LANGUAGE_URL = 'https://github.com/trending/unknown?since=weekly'

  weekly_page = Nokogiri::HTML(open(TRENDING_URL))

  # fetch all of the HTML `<li>` elements that represent individual repositories
  repo_list_items = weekly_page.css(".repo-list li")

  #output the first repository's name
  #my strategy is to map over the repo items to create an array of hashes that can be used to seed a db
  repo_list_items.each do |repository|
    name = repository.css("h3")[0].text.strip

    puts name
    puts "==========================="

    description = repository.css("p").text.strip

    puts description
    puts ""

    language = repository.css(".ml-0 span").text.strip

    if language == ""
      language = "NA"
    end

    puts "Written primarily in #{language}"
    puts ""

    contributors = repository.css("img")

    contributor_names = contributors.map do |contributor|
      contributor.attributes["alt"].value.delete("@")
    end

    puts "Primary Contributors: #{contributor_names.join(', ')}"
    puts "---------------------------"
    puts "\n\n"
  end

  js_page = Nokogiri::HTML(open(JAVASCRIPT_ONLY_URL))
  js_list_items = js_page.css(".repo-list li")
  puts "Number of JavaScript repos this week: #{js_list_items.count}"

  no_lang_page = Nokogiri::HTML(open(UNSPECIFIED_LANGUAGE_URL))
  no_lang_list_items = no_lang_page.css(".repo-list li")
  puts "Number of repos with no specified language this week: #{no_lang_list_items.count}"
end
