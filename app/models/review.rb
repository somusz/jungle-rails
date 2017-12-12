class Review < ActiveRecord::Base
  #relationships with user and product
  belongs_to :user
  belongs_to :product

  #reviews must belong to a product and a user, has to have description and a rating to be valid
  validates :product_id, presence: true
  validates :user_id, presence: true
  validates :description, presence: true
  validates :rating, presence: true
end
