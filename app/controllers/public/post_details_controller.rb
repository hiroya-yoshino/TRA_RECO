class Public::PostDetailsController < ApplicationController


  def create
    @post = Post.find(params[:post_id])
    @post_detail = PostDetail.new(post_detail_params)
    @post_detail.post = @post
    if @post_detail.save
      redirect_to post_path(@post_detail.post_id)
    end
  end

  private

  def post_detail_params
    params.require(:post_detail).permit(:spot_name, :visit_time, :impre, :image)
  end
end
