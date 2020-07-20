Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  resources :posts, only: [:new, :create, :index, :show, :edit, :destroy, :update] do
  	 resource :favorites, only: [:create, :destroy]
     resources :post_comments, onyl: [:create, :destroy]
  end
   #delete '/posts/:post_id/post_comments/:id' => 'post_comments#destroy'
   #post '/post/:post_id/post_comments' => 'post_comments#create'


  resources :users, only: [:new, :create, :show, :edit, :update]

  root 'posts#index'
end
