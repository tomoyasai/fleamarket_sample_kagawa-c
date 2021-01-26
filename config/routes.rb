Rails.application.routes.draw do
  root 'items#index'
  resources :items
  get 'mypage',to: 'users#show'
  get 'buyconfirm',to: 'items#buyconfirm'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
