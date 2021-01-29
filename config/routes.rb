Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root 'items#index'
  resources :items
  get 'mypage',to: 'users#show'
  
  # devise_scope :user do
  #   get '/users/sign_out#destroy'
  # end

  # resources :users
  # root 'users#new

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end