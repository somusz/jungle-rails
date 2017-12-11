class ReviewsController < ApplicationController
  before_filter :check_user_session

  def create
    current_user = User.find(session_params)
    @review = Review.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      rating: params[:rating],
      description: params[:review][:description]
    )
    if @review.valid?
      @review.save
      redirect_to product_path(params[:product_id])
    else
      redirect_to root_path
    end
  end

  def destroy
    @review = Product.find(params[:product_id]).reviews.find(params[:id])
    @review.destroy
    redirect_to :back
  end

  private

  def check_user_session()
    unless session
      redirect_to session[:return_to]
    end
  end

  def session_params
    session[:user_id]
  end

end
