class Product < ActiveRecord::Base

  #product helpers
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  #relationships with reviews and category
  has_many :reviews
  belongs_to :category

  #product has to have a name, a price, quantity and a category
  validates :name, presence: { message: "must be given please" }
  validates :price, presence: { message: "must be given please" }
  validates :quantity, presence: { message: "must be given please" }
  validates :category, presence: { message: "must be given please" }

end
