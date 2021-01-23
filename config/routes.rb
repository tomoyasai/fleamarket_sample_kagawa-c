Rails.application.routes.draw do
  root 'items#index'
  resources :items
  get '/show', to: 'items#show'


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
