class Public::HomesController < ApplicationController


  def top
    @posts = Post.page(params[:page]).per(10).where(status: true)
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :location, :date, :status)
  end
end
