class ProductsController < ApplicationController

  #compiling products index page
  def index
    @products = Product.all.order(created_at: :desc)
  end

  #compiling products show page
  def show
    @product = Product.find params[:id]
  end

end
