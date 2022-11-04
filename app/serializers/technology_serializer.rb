class TechnologySerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :users, through: :users_technologies

  has_many :studies
  has_many :certificates
end
