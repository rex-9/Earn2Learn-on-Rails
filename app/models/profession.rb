class Profession < ApplicationRecord
  belongs_to :user
  belongs_to :technology
end
