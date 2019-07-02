class RepositorySerializer < ActiveModel::Serializer
  attributes :name, :description, :language
  has_many :contributors, through: :contributions
end
