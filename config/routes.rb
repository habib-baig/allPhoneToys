Rails.application.routes.draw do
  resources :admins
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
  get '/adminDashboard', to: 'admins#dashboard'
  get '/todaysPickups', to: 'transactions#todays_pickups'
  delete '/todaysPickups/:id', to: 'transactions#do_pickup', as: 'do_pickup'
  get '/todaysRecharges', to: 'transactions#todays_recharges'
  delete '/todaysRecharges/:id', to: 'transactions#do_recharge', as: 'do_recharge'
  post   '/',   to: 'transactions#index', as: 'transaction_index'

  get '/locations', to: 'locations#index'
  get '/locations/new', to: 'locations#new', as: 'new_location'
  post '/locations', to: 'locations#create'
  delete '/locations/:id', to: 'locations#destroy', as: 'deleteLocation'

  get '/providers', to: 'providers#index'
  get '/providers/new', to: 'providers#new', as: 'new_provider'
  post '/providers', to: 'providers#create'
  delete '/providers/:id', to: 'providers#destroy', as: 'deleteProvider'

end
