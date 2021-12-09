class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    #そのユーザ（@user）に関連付けられた投稿（.post_images）のみ、@post_imagesに渡すことができる。
    #また、全体の投稿ではなく、個人が投稿したもののみを表示できる。
    @post_images = @user.post_images.page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

   private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

end
