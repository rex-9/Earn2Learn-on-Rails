class Like < ApplicationRecord
  after_create :update_study_like_count
  after_destroy :update_study_like_count

  belongs_to :user
  belongs_to :study

  private

  def update_study_like_count
    self.study.like_count = self.study.likes.count
    self.study.save!
  end
end
