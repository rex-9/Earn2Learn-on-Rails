class User < ApplicationRecord
  has_secure_password

  has_many :professions
  has_many :technologies,                       through: :professions

  has_many :studies
  has_many :certificates
  has_many :likes
  has_many :comments

  validates :username, :email, :phone,          uniqueness: true
  validates :fullname, :city, :birthdate, :username, :email, :phone,       presence: true
end
