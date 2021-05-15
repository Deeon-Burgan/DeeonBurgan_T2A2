Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'main#index'
  get '/listings/:id', to: 'listings#index', as: 'listings'
  get '/listings/:id/new', to: 'listings#new'
  post '/listings/:id/new', to: 'listings#create'
end
