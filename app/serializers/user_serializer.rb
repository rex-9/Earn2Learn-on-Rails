class UserSerializer < ActiveModel::Serializer
  attributes :id, :username
  has_many :studies
  has_many :certificates
end
