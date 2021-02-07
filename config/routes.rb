Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :items, only: [:index, :new, :create]
  get 'mypage',to: 'users#show'
  get '/show', to: 'items#show'
  get 'api/items/category',to: 'items#get_category'

  get 'mypage',to: 'users#show'
  get 'buyconfirm',to: 'items#buyconfirm'
  get 'card_new',to: 'items#card_new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
