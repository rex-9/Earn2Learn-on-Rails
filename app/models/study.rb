class Study < ApplicationRecord
  belongs_to :user
  belongs_to :technology

  validates :topic, :hours_taken,      presence: true
end
