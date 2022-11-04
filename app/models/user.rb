class User < ApplicationRecord
  has_many :studies
  has_many :technologies
end
