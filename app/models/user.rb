class User < ApplicationRecord
  has_many :users_technologies
  has_many :technologies, through: :users_technologies

  has_many :studies
  has_many :certificates
end
