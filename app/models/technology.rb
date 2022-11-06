class Technology < ApplicationRecord
  has_many :professions
  has_many :users,          through: :professions

  has_many :studies
  has_many :certificates

  validates :name,         presence: true, uniqueness: true
end
