class Admin::PostsController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @post = Post.find(params[:id])
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments
    @post_details = @post.post_details
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to admin_post_path(@post.id)
    else
      render :edit
    end
  end

  def destroy
    post1 = Post.find(params[:id])
    post1.destroy
    redirect_to admin_path
  end


  private

  def post_params
    params.require(:post).permit(:user_id, :title, :location, :date, :status, :image)
  end
end
