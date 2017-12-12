class CategoriesController < ApplicationController

  #compiles category and products related to the category
  def show
    @category = Category.find(params[:id])
    @products = @category.products.order(created_at: :desc)
  end

end
