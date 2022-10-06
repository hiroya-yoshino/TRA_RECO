class Public::PostDetailsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @post_detail = PostDetail.new(post_detail_params)
    @post_detail.post = @post
    if @post_detail.save
      redirect_to post_path(@post_detail.post_id)
    end
  end

  def edit
    @post_detail = PostDetail.find(params[:id])
  end

  def update
    @post_detail = PostDetail.find(params[:id])
    if @post_detail.update(post_detail_params)
      redirect_to post_path(@post_detail.post_id)
    else
      render :edit
    end
  end

  def destroy
    post_detail = PostDetail.find(params[:id])
    @post = Post.find(params[:post_id])
    post_detail.destroy
    redirect_to post_path(@post.id)
  end

  private

  def post_detail_params
    params.require(:post_detail).permit(:spot_name, :visit_time, :impre, :image)
  end
end
