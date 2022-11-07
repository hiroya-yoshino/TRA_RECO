class Public::HomesController < ApplicationController

  def top
    @posts = Post.page(params[:page]).per(10).where(status: true)

  end

  def search
    @follower_select = params[:follower_select]
    if @follower_select == 'true'
      post_places = Post.search_place(params[:place]).where(user_id: [*current_user.following_ids])
    else
      post_places = Post.search_place(params[:place])
    end
    @posts = post_places.search(params[:keyword]).page(params[:page]).per(10).where(status: true)
    @keyword = params[:keyword]
    render "top"
  end

  private

  def post_params
    params.require(:post).permit(:user_id, :title, :location, :date, :status)
  end
end
