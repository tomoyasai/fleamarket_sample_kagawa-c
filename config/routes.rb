Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root 'items#index'
  resources :items, only: [:index, :new, :create, :show]
  get 'mypage',to: 'users#show'
  get 'api/items/category',to: 'items#get_category'

  get 'mypage',to: 'users#show'
  get 'buyconfirm',to: 'items#buyconfirm'
  
  get 'card_new',to: 'cards#new'
  post 'card_new', to: 'cards#show'
  
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end