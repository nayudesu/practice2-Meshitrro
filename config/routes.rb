Rails.application.routes.draw do
  devise_for :users #devise を使用する際にURLとしてusersを含むことを示す
  #devise のモデルを作成したことで自動で追加される
  root to: "homes#top" #root to:はサイトのルートページを決める記述
  
   #resources=ルーティングを一括して自動生成してくれる機能
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
  #コメントは、投稿画像に対してコメントされるためpost_imageの中に記述 
  
    resource :favorites, only: [:create, :destroy] #いいねは、投稿画像に対してコメントされるためpost_imageの中に記述 
  #resoutce(単数系)であるのは、１つの投稿にユーザーは１ついいねのみのため、params[:id]不要

  end #親子関係のため、do-endの記述をする
  
  resources :users, only: [:show, :edit, :update]

  get 'homes/about' => "homes#about", as:'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
