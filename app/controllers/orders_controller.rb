class OrdersController < ApplicationController

  #compiles orders
  def show
    @order = Order.find(params[:id])
  end

  #creates an order
  def create
    charge = perform_stripe_charge
    order  = create_order(charge)

    #evaluates order and places if valid
    if order.valid?
      empty_cart!
      mail_order_receipt(order)
      redirect_to order, notice: 'Your Order has been placed.'
    else
      redirect_to cart_path, flash: { error: order.errors.full_messages.first }
    end

  #handling stripe error
  rescue Stripe::CardError => e
    redirect_to cart_path, flash: { error: e.message }
  end

  private

  #mail order details
  def mail_order_receipt(order)
    UserMailer.order_receipt(order).deliver_now
  end

  #helper for emptying cart
  def empty_cart!
    # empty hash means no products in cart :)
    update_cart({})
  end

  #stripe helper
  def perform_stripe_charge
    Stripe::Charge.create(
      source:      params[:stripeToken],
      amount:      cart_total, # in cents
      description: "Khurram Virani's Jungle Order",
      currency:    'cad'
    )
  end

  #helper for creating order
  def create_order(stripe_charge)
    order = Order.new(
      email: params[:stripeEmail],
      total_cents: cart_total,
      stripe_charge_id: stripe_charge.id, # returned by stripe
    )
    cart.each do |product_id, details|
      if product = Product.find_by(id: product_id)
        quantity = details['quantity'].to_i
        order.line_items.new(
          product: product,
          quantity: quantity,
          item_price: product.price,
          total_price: product.price * quantity
        )
      end
    end
    order.save!
    order
  end

  # returns total in cents not dollars (stripe uses cents as well)
  def cart_total
    total = 0
    cart.each do |product_id, details|
      if p = Product.find_by(id: product_id)
        total += p.price_cents * details['quantity'].to_i
      end
    end
    total
  end

end
