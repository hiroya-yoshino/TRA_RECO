class Public::PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @comment = Comment.new
    @post_details = @post.post_details
    if current_user&.id == @post.user_id
      @post_detail = PostDetail.new
      @post_detail.post_id = @post.id
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post1 = Post.find(params[:id])
    post1.destroy
    redirect_to user_path(current_user.id)
  end


  private

  def post_params
    params.require(:post).permit(:user_id, :title, :location, :date, :status, :image)
  end
end
