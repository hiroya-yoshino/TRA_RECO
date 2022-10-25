class Public::RelationshipsController < ApplicationController
  before_action :guest_check!

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end

  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

  private
  def guest_check!
    if current_user.email == 'guest@example.com'
      redirect_to root_path, notice: "フォロー機能を使うにはユーザ登録が必要です。"
    end
  end
end
