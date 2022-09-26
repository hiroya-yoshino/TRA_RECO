class Public::HomesController < ApplicationController


  def top
    @posts = Post.page(params[:page]).per(10).where(status: true)
  end

  def search
    post_places = Post.search_place(params[:place])
    @posts = post_places.search(params[:keyword]).page(params[:page]).per(10).where(status: true)
    pp @posts
    @keyword = params[:keyword]
    render "top"
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :location, :date, :status)
  end
end
