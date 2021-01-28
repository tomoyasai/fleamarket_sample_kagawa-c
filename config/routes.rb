Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root 'items#index'
  resources :items
  get 'mypage',to: 'users#show'

  # resources :users

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end