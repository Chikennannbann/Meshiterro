Rails.application.routes.draw do

  root to: 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 get "/homes/about" => "homes#about", as: "about"

 resources :post_images, only: [:new, :create, :index, :show, :destroy]
# コントローラ名がpost_imagesと一致しているか？
 resources :users, only: [:show, :edit]

end
