class UserSerializer < ActiveModel::Serializer
  attributes :id, :username

  has_many :technologies, through: :users_technologies

  has_many :studies
  has_many :certificates
end
