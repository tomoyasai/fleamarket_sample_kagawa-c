Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items
  get '/show', to: 'items#show'

  get 'mypage',to: 'users#show'
  get 'buyconfirm',to: 'items#buyconfirm'
  get 'card_new',to: 'items#card_new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
