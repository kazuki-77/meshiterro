class PostCommentsController < ApplicationController

  def create
    # パラメータで指定された投稿画像を検索して、変数「post_image」へ格納する
    post_image = PostImage.find(params[:post_image_id])
    # 新しいコメントを生成して、変数「comment」へ格納する
    comment = current_user.post_comments.new(post_comment_params)
    # 先ほど生成したコメントの投稿画像IDにパラメータで渡された投稿画像IDを設定する
    comment.post_image_id = post_image.id
     # 先ほど生成したコメントをDBに保存する
    comment.save
    # 投稿画像のページへリダイレクトする
    redirect_to post_image_path(post_image)

  end

  def destroy
    PostComment.find_by(id: params[:id]).destroy
    redirect_to post_image_path(params[:post_image_id])
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end

end
