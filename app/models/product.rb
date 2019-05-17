class Product < ApplicationRecord


  has_many :tracks
  accepts_nested_attributes_for :tracks, reject_if: :all_blank, allow_destroy: true

  attachment :image

<<<<<<< HEAD
=======
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




>>>>>>> 22960e94a0754978bac051d3ccf02674a4101311
end
