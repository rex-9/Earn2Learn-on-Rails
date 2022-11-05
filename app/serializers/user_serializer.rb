class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :fullname, :email, :city, :bio, :birthdate, :image, :role

  has_many :technologies, through: :users_technologies

  has_many :studies
  has_many :certificates
end
