class LineItem < ActiveRecord::Base
  #relationships with order and product
  belongs_to :order
  belongs_to :product

  #monetary values are stored in cents
  monetize :item_price_cents, numericality: true
  monetize :total_price_cents, numericality: true

end
