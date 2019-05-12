class Product < ApplicationRecord


  has_many :tracks
  accepts_nested_attributes_for :tracks, reject_if: :all_blank, allow_destroy: true

  attachment :image

end
