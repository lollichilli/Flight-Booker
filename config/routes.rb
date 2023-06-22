Rails.application.routes.draw do
  root 'flights#index'
  get 'flights/search', to: 'flights#search'
  get 'bookings/new', to: 'bookings#new'
  post 'bookings/create', to: 'bookings#create'
  resources :bookings, only: [:new, :create, :show]

end