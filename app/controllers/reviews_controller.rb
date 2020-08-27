class ReviewsController < ApplicationController
  before_filter :deny_access, :unless => :current_user

  def create
    product = Product.find_by(id: params[:product_id])
    product.reviews.create({
      rating: params[:review][:rating],
      description: params[:review][:description],
      user_id: session[:user_id]
    })
    redirect_to "/products/#{params[:product_id]}"
  end

  def destroy
    review = Review.find params[:id]
    review.destroy
    redirect_to "/products/#{params[:product_id]}", notice: 'Product deleted!'
  end
end