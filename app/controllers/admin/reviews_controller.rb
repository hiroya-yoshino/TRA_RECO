class Admin::ReviewsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @reviews = Review.all
  end
  
  def destroy
    review = Review.find(params[:id])
    review.destroy
    redirect_to admin_reviews_path
  end
  
  def show
    @post = Post.find(params[:id])
    @reviews = @post.reviews
  end
  
  def review_params
    params.require(:review).permit(:title, :user_id, :post_id, :content)
  end
end
