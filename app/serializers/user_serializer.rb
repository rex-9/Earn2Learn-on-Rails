class UserSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :id, :username, :fullname, :email, :catchphrase, :views, :goal, :city, :phone, :bio, :birthdate, :image, :role, :github, :linkedin

  has_many :technologies, through: :professions

  has_many :studies
  has_many :certificates

  def image
    # return unless object.image.attached?
    # object.image.blob.attributes
    #       .slice('filename', 'byte_size')
    #       .merge(url: image_url)
    #       .tap { |attrs| attrs['name'] = attrs.delete('filename') }
    if object.image.attached?
      rails_blob_url(object.image)
    end
  end

  def image_url
    url_for(object.image)
  end
end
