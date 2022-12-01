class CertificateSerializer < ActiveModel::Serializer
  attributes :id, :title, :link, :achieved_date, :expiration_date

  belongs_to :user
  belongs_to :technology
end
