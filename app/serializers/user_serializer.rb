class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :username, :fullname, :email, :catchphrase, :views, :goal, :city, :phone, :bio, :birthdate, :image, :role, :github, :linkedin

  has_many :technologies, through: :professions

  has_many :studies
  has_many :certificates

  def image
    if object.image.attached?
      rails_blob_url(object.image)
    end
  end
end
