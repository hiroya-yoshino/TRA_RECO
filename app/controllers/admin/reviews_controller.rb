class Admin::ReviewsController < ApplicationController
  
  def index
    @reviews = Review.all
  end
  
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_reviews_path
  end
  
  def review_params
    params.require(:review).permit(:title, :user_id, :post_id, :content)
  end
end
