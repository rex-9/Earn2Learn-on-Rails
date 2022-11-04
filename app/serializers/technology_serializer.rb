class TechnologySerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :studies
  has_many :certificates
end
