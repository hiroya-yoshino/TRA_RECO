class Public::ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @review = Review.new
  end

  def create
    @post = Post.find(params[:post_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.post = @post
    if @review.save
      redirect_to post_reviews_path(@post.id)
    end
  end

  def index
    @post = Post.find(params[:post_id])
    @reviews = @post.reviews
  end
  
  def show
    @post = Post.find(params[:id])
    @reviews = @post.reviews
  end

  private

  def review_params
    params.require(:review).permit(:title, :user_id, :post_id, :content)
  end
end
