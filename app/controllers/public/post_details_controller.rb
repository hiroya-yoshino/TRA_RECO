class Public::PostDetailsController < ApplicationController
  before_action :authenticate_user!

  def create
    @post = Post.find(params[:post_id])
    @post_detail = PostDetail.new(post_detail_params)
    @post_detail.post = @post
    if @post_detail.save
      redirect_to post_path(@post_detail.post_id)
    else
      @comments = @post.comments
      @comment = Comment.new
      @post_details = @post.post_details.order(visit_time: :ASC)
      if current_user&.id == @post.user_id
        @post_detail = PostDetail.new
        @post_detail.post_id = @post.id
      end
      render 'public/posts/show'
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

  def upload_image
    @image = create_blob(params[:image])
    render json: @image
  end

  def map
    @post_detail = PostDetail.find(params[:post_detail_id])
  end

  private

  def post_detail_params
    params.require(:post_detail).permit(:spot_name, :visit_time, :impre, :image [], :address).merge(images: uploaded_images)
  end

  def uploaded_images
    params[:post_detail][:images].drop(1).map{|id| ActiveStorage::Blob.find(id)} if params[:post_detail][:images]
  end

  def create_blob(file)
    ActiveStorage::Blob.create_and_upload!(io: file.open, filename: file.original_filename, content_type: file.content_type)
  end

end
