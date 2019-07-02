require "rails_helper"

RSpec.describe Repository do
  context "Persisting a repository" do
    it "is created with a name, description, and language" do
      repository = Repository.create!(name: "banana", description: "Definitely more bananas", language: "BananaScript")

      expect(repository.name).to eq("banana")
      expect(repository.description).to eq("Definitely more bananas")
      expect(repository.language).to eq("BananaScript")
    end

    it "has multiple contributors" do
      repository = Repository.create!
      contributor1 = repository.contributors.create!(name: "Steve")
      contributor2 = repository.contributors.create!(name: "Jani")

      expect(repository.contributors).to eq([contributor1, contributor2])
    end
  end
end
