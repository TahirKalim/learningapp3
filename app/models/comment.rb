class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }

  validates :body, :user, :product, presence: { message: "All fields required" }
  validates :rating, numericality: { only_integer: true, less_than: 6 }

  after_create_commit { CommentUpdateJob.perform_later(self, @user) }

  
end
