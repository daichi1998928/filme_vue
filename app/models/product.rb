class Product < ApplicationRecord

  has_many :tracks
  accepts_nested_attributes_for :tracks, reject_if: :all_blank, allow_destroy: true
  has_many :product_reviews
  attachment :image

  validates :product_title, presence: true
  validates :image, presence: true
  validates :price, presence: true
  validates :label_name, presence: true
  validates :stock, presence: true

  def self.search(search)
      if search
        Product.where('product_title LIKE ?', "#{search}%")
      else

      end
  end

  def product_reviewed_by?(user)
    product_reviews.where(user_id: user.id).exists?
  end



end
