Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :posts, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
  	 resource :favorites, only: [:create, :destroy]
     resources :post_comments, onyl: [:create, :destroy]
  end



  resources :users, only: [:new, :create, :show, :edit, :update]

  root 'users#top'
end
