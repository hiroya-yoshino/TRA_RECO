class Admin::PostDetailsController < ApplicationController
  before_action :authenticate_admin!

  def edit
    @post_detail = PostDetail.find(params[:id])
  end

  def update
    @post_detail = PostDetail.find(params[:id])
    if @post_detail.update(post_detail_params)
      redirect_to admin_post_path(@post_detail.post_id)
    else
      render :edit
    end
  end

  def destroy
    post_detail = PostDetail.find(params[:id])
    @post = Post.find(params[:id])
    post_detail.destroy
    redirect_to admin_post_path(@post.id)
  end

  private

  def post_detail_params
    params.require(:post_detail).permit(:spot_name, :visit_time, :impre, :image)
  end
end
