class StudySerializer < ActiveModel::Serializer
  attributes :id, :topic
  belongs_to :user
  belongs_to :technology
end
