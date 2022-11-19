Rails.application.routes.draw do
  
  root to: 'homes#top'
  get 'home/about' => 'homes#about'
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  # 上記をまとめたのが
  resources :books, only: [:index, :create, :show, :edit, :update, :destroy]
  devise_for :users
  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  resources :users, only:[:show, :index, :edit, :update]
  
  
end
