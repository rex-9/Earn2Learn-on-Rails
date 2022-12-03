class Certificate < ApplicationRecord
  after_create :update_user_certificate_count
  after_destroy :update_user_certificate_count

  after_create :update_tech_certificate_count
  after_destroy :update_tech_certificate_count

  belongs_to :user
  belongs_to :technology

  validates :title, :link,      presence: true

  private
  def update_user_certificate_count
    self.user.certificate_count = self.user.certificates.count
  end

  def update_tech_certificate_count
    self.technology.certificate_count = self.technology.certificates.count
  end
end
