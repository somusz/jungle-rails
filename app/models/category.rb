class Category < ActiveRecord::Base
  #relationship with products
  has_many :products

end
