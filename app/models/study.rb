class Study < ApplicationRecord
  after_create :update_user_study_count
  after_destroy :update_user_study_count

  after_create :update_tech_study_count
  after_destroy :update_tech_study_count

  belongs_to :user
  belongs_to :technology

  has_many :likes
  has_many :comments

  validates :topic, :hours_taken,      presence: true

  private

  def update_user_study_count
    self.user.study_count = self.user.studies.count
  end

  def update_tech_study_count
    self.technology.study_count = self.technology.studies.count
  end
end
