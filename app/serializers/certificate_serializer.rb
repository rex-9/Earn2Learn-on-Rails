class CertificateSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :user
  belongs_to :technology
end
