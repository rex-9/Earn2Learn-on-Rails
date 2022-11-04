class UsersTechnologySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :technology_id
  # belongs_to :user
  # belongs_to :technology
end
