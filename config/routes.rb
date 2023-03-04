Rails.application.routes.draw do
  
 devise_for :users
 
 resources :users, only: [:show, :edit, :update]
 resources :books, only: [:new, :create, :index, :show, :edit, :destroy]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
 root to: "homes#top"
 get 'home/about' => 'homes#about', as: 'about'
  
  
end
