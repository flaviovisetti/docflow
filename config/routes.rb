Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :users, only: [:new, :create, :show]
  resources :companies, only: [:new, :create, :show]
  resources :tickets, only: [:new, :create, :show]
end
