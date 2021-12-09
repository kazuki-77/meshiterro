Rails.application.routes.draw do

 root to: 'homes#top'
 devise_for :users
 resources :post_images, only: [:new, :create, :index, :show, :destroy] do
  #resourceとなっているのは単数にすると、そのコントローラのidがリクエストに含まれなくなる。
  #今回はいいねの詳細ページは作らないのでidの受け渡しもなく単数形になっているrai
  resource :favorites, only: [:create, :destroy]

  resources :post_comments, only: [:create, :destroy]
 end


end
