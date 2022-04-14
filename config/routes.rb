Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 get "/homes/about" => "homes#about", as: "about"

 resources :post_images, only: [:new, :create, :index, :show, :destroy] do
# コントローラ名がpost_imagesと一致しているか？
  resource :favorites, only: [:create, :destroy]
  # 単数形にすると、/:idがURLに含まれなくなる
  # それ自身のidが分からなくても、関連する他のモデルのidから特定できる」といった場合に用いる
  resources :post_comments, only: [:create, :destroy]
 end

 resources :users, only: [:show, :edit, :update]

end