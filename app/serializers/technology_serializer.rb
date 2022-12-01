class TechnologySerializer < ActiveModel::Serializer
  attributes :id, :name

  has_many :users, through: :professions

  has_many :studies
  has_many :certificates
end
