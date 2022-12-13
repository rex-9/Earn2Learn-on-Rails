class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :fullname, :email, :catchphrase, :views, :goal, :city, :phone, :bio, :birthdate, :image, :role

  has_many :technologies, through: :professions

  has_many :studies
  has_many :certificates
end
