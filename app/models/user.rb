class User < ApplicationRecord
  has_secure_password

  has_many :users_technologies
  has_many :technologies,                       through: :users_technologies

  has_many :studies
  has_many :certificates

  validates :username, :email,                  presence: true, uniqueness: true
  validates :fullname, :city, :birthdate,       presence: true
end
