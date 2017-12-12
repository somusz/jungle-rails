class Order < ActiveRecord::Base

  #relationships with user and line items
  belongs_to :user
  has_many :line_items

  monetize :total_cents, numericality: true

  #order requires stripe id
  validates :stripe_charge_id, presence: true

end
