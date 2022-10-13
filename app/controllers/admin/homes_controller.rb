class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @posts = Post.page(params[:page]).per(10)
  end

  def search
    post_places = Post.search_place(params[:place])
    @posts = post_places.search(params[:keyword]).page(params[:page]).per(10).where(status: true)
    @keyword = params[:keyword]
    render "top"
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :location, :date, :status)
  end
end
