Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :posts, only: [:new, :create, :index, :show, :edit]

  resources :users, only: [:new, :create, :show, :edit, :update]

  root 'posts#index'
end
