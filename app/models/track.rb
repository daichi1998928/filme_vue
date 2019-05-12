class Track < ApplicationRecord

  belongs_to :product


  validates :track_name, presence: true
  validates :artist_name, presence: true
  validates :track_order, presence: true


end
