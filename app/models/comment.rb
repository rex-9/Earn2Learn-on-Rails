class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :study

  validates :content,     presence: true
end
