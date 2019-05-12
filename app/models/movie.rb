class Movie < ApplicationRecord
  attachment :image
  validates :title, presence: true
  validates :image, presence: true
  validates :detail, presence: true


end
