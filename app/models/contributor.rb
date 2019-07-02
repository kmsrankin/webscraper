class Contributor < ApplicationRecord
  has_many :contributions
  has_many :repositories, through: :contributions
end
