class PostImagesController < ApplicationController

  def new
    @post_image = PostImage.new
  end

  #post_image_paramsではフォームで入力されたデータが
  #投稿データとして許可されているパラメータかどうかをチェックしている
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    if @post_image.save
      redirect_to post_images_path #投稿一覧画面へリダイレクト
    else
      render :new
    end

  end

  def index
    @post_images = PostImage.page(params[:page]).reverse_order
    #タイムライン上に表示する投稿データを取得できるようになる。
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new #コメントのインスタンス変数
  end

  def destroy
    @post_image = PostImage.find(params[:id])
    @post_image.destroy
    redirect_to post_images_path
  end

  private
   def post_image_params
     params.require(:post_image).permit(:shop_name, :image, :caption)
   end

end
