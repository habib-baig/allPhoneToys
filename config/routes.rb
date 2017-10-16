Rails.application.routes.draw do
  resources :transactions
  get 'sessions/new'
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'

  get   '/transactions', to: 'transactions#index'
  get   '/schedulePickup', to: 'transactions#new', as: 'schedulePickup'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
end
