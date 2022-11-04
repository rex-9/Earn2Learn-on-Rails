class Technology < ApplicationRecord
  has_many :studies
  has_many :certificates
end
