Rails.application.routes.draw do

  root to: "home#top"
  get 'home/about' => 'home#about'
  devise_for :users

  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    resource :relationships, only: [:create, :destroy]
  	get "followings" => "relationships#followings", as: "followings"
  	get "followers" => "relationships#followers", as: "followers"
  end

end