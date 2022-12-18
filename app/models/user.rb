class User < ApplicationRecord
  has_secure_password
  has_one_attached :image

  has_many :professions
  has_many :technologies,                       through: :professions

  has_many :studies
  has_many :certificates
  has_many :likes
  has_many :comments

  validates :username, :email, :phone,          uniqueness: true
  validates :fullname, :catchphrase, :goal, :views, :city, :birthdate, :username, :email, :phone,       presence: true
  validates :catchphrase,                       length: { in: 3..120 }
end
