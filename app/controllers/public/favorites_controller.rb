class Public::FavoritesController < ApplicationController

  def create
    pos = Post.find(params[:post_id])
    favorite = current_user.favorites.new(post_id: pos.id)
    favorite.save
    redirect_to post_path(pos)
  end

  def destroy
    pos = Post.find(params[:post_id])
    favorite = current_user.favorites.find_by(post_id: pos.id)
    favorite.destroy
    redirect_to post_path(pos)
  end

  def index
    @user = User.find(params[:user_id])
    @favorites = @user.favorites
    @posts = @favorites.posts
  end

end
