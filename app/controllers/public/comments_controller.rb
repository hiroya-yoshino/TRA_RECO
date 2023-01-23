class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :guest_check!

  def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post_id = @post.id
    if @comment.save
      redirect_to post_path(@post.id)
    else
      render 'public/posts/show'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:detail, :post_id, :user_id)
  end

  def guest_check!
    if current_user.email == 'guest@example.com'
      redirect_to root_path, notice: "コメントを送るにはユーザ登録が必要です。"
    end
  end

end
