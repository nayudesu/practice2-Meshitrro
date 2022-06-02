Rails.application.routes.draw do
  devise_for :users #devise を使用する際にURLとしてusersを含むことを示す
  #devise のモデルを作成したことで自動で追加される
  root to: "homes#top" #root to:はサイトのルートページを決める記述
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy]
  #resources=ルーティングを一括して自動生成してくれる機能
  resources :users, only: [:show, :edit]

  get 'homes/about' => "homes#about", as:'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
