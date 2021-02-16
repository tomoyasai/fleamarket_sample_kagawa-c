Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root 'items#index'

  resources :items, only: [:index, :new, :create, :show] do 
    collection do
      get 'search'
    end
    member do
      get 'buyconfirm',to: 'items#buyconfirm'
    end
  end

  resources :items, only: [:index, :new, :create, :show, :destroy, :edit, :update]

  get 'mypage',to: 'users#show'

  get 'api/items/category',to: 'items#get_category'

  get 'mypage',to: 'users#show'
  # get 'buyconfirm',to: 'items#buyconfirm'
  
  get 'card_new',to: 'cards#new'
  post 'card_new', to: 'cards#show'
  
  resources :cards, only:[:index, :new, :create, :destroy, :show] do
    member do
      post 'pay'
    end
  end
  # resources :cards, only: [:new, :show] do
  #   collection do
  #     post 'show', to: 'card#show'
  #     post 'pay', to: 'card#pay'
  #     post 'delete', to: 'card#delete'
  #   end
  # end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end