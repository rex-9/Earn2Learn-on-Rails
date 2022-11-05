class StudySerializer < ActiveModel::Serializer
  attributes :id, :topic, :experience, :completed, :hours_taken
  belongs_to :user
  belongs_to :technology
end
