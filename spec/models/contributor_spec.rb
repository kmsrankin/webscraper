require "rails_helper"

RSpec.describe Contributor do
  context "Persisting a contributor" do
    it "is created with a name" do
      contributor = Contributor.create!(name: "Mr. Banana?")

      expect(contributor.name).to eq("Mr. Banana?")
    end

    it "has contributed to multiple repositories" do
      contributor = Contributor.create!(name: "Mr. Banana?")
      repository1 = contributor.repositories.create!
      repository2 = contributor.repositories.create!

      expect(contributor.repositories).to eq([repository1, repository2])
    end
  end
end
