class Movie < ApplicationRecord
  attachment :image
  validates :title, presence: true
  validates :image, presence: true
  validates :detail, presence: true
  has_many :movie_reviews


  def movie_reviewed_by?(user)
    movie_reviews.where(user_id: user.id).exists?
  end


end
