class ReviewsController < ApplicationController
  #checks if user is logged in
  before_filter :check_user_session

  #creating a new review
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

  #removing a review for authors only
  def destroy
    @review = Product.find(params[:product_id]).reviews.find(params[:id])
    @review.destroy
    redirect_to :back
  end

  private

  #helper for checking logged in users
  def check_user_session()
    unless session
      redirect_to session[:return_to]
    end
  end

  #helper for session parameters
  def session_params
    session[:user_id]
  end

end
