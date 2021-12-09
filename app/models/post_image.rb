class PostImage < ApplicationRecord

  belongs_to :user
  attachment :image # ここを追加（_idは含めません）
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #favorited_by?メソッドで引数で渡されたユーザidがFavoritesテーブル内に存在（exists?）するかどうかを調べ。
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

end
