class Product < ActiveRecord::Base

  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  has_many :reviews
  belongs_to :category

  validates :name, presence: { message: "must be given please" }
  validates :price, presence: { message: "must be given please" }
  validates :quantity, presence: { message: "must be given please" }
  validates :category, presence: { message: "must be given please" }

end
