class Comment < ApplicationRecord
  after_create :update_study_comment_count
  after_destroy :update_study_comment_count

  belongs_to :user
  belongs_to :study

  validates :content,     presence: true

  private

  def update_study_comment_count
    self.study.comment_count = self.study.comments.count
  end
end
