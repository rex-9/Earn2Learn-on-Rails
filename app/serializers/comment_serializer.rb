class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :username

  belongs_to :study
end
