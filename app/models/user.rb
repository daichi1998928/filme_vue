class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_paranoid
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  has_many :product_reviews
  has_many :movie_reviews
  has_many :history
  attachment :image
  has_many :favorites
  validates :email, uniqueness: true


end
