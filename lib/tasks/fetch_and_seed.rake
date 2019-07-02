desc "Fetch and seed database"
task :fetch_and_seed => :environment do

  require 'nokogiri'
  require 'open-uri'

  Repository.destroy_all
  Contribution.destroy_all
  Contributor.destroy_all

  TRENDING_URL = 'https://github.com/trending?since=weekly'

  weekly_page = Nokogiri::HTML(open(TRENDING_URL))

  # fetch all of the HTML `<li>` elements that represent individual repositories
  repo_list_items = weekly_page.css(".repo-list li")

  repo_list_items.each do |repository|
    name = repository.css("h3")[0].textq.strip
    description = repository.css("p").text.strip
    language = repository.css(".ml-0 span").text.strip

    if language == ""
      language = "NA"
    end

    current_repo = Repository.create!({
      name: name,
      description: description,
      language: language
    })

    contributors = repository.css("img")

    contributors.each do |contributor|
      contributor_name = contributor.attributes["alt"].value.delete("@")
      current_contributor = Contributor.new({
        name: contributor_name
      })
      if !Contributor.find_by(name: contributor_name)
        current_contributor.save!
      else
        current_contributor = Contributor.find_by(name: contributor_name)
      end

      Contribution.create!(
        repository: current_repo,
        contributor: current_contributor
      )
    end
  end
  puts "Created #{Repository.count} repositories"
  puts "Created #{Contributor.count} contributors"
end
