class Certificate < ApplicationRecord
  belongs_to :user
  belongs_to :technology

  validates :title, :link,      presence: true
end
