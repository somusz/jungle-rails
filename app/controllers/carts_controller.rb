class CartsController < ApplicationController

  #cart is only accessible if user is logged in,
  #otherwise it redirets to the login page
  def show
    unless session[:user_id]
      redirect_to new_session_path
    end
  end

  #adds a unit of an item to cart
  def add_item
    product_id = params[:product_id].to_s

    item = cart[product_id] || { "quantity" => 0 }
    item["quantity"] += 1
    cart[product_id] = item
    update_cart cart

    redirect_to :back
  end

  #removes a unit of an item from cart
  def remove_item
    product_id = params[:product_id].to_s

    item = cart[product_id] || { "quantity" => 1 }
    item["quantity"] -= 1
    cart[product_id] = item
    cart.delete(product_id) if item["quantity"] < 1
    update_cart cart

    redirect_to :back
  end

end
