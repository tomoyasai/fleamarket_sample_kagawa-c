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
  
  resources :cards, only:[:index, :new, :create, :destroy] do
    member do
      post 'buy'
    end
  end

  get 'card_new',to: 'cards#new'

  get 'card_data', to: 'cards#show'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end