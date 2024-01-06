Rails.application.routes.draw do

  root to: "home#top"
  get 'home/about' => 'home#about'
  devise_for :users

  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update, :index]


end