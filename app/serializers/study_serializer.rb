class StudySerializer < ActiveModel::Serializer
  attributes :id, :topic, :experience, :completed, :hours_taken, :like_count, :comment_count

  belongs_to :user
  belongs_to :technology

  has_many :comments
end
