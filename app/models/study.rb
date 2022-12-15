class Study < ApplicationRecord
  belongs_to :user
  belongs_to :technology

  has_many :likes
  has_many :comments

  validates :topic, :hours_taken,      presence: true
  validates_length_of :topic,          minimum: 3
end
