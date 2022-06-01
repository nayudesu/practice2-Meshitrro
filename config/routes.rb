Rails.application.routes.draw do
  devise_for :users #devise を使用する際にURLとしてusersを含むことを示す
  #devise のモデルを作成したことで自動で追加される
  root to: "homes#top" #root to:はサイトのルートページを決める記述
  get 'homes/about' => "homes#about", as:'about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
