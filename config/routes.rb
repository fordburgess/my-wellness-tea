Rails.application.routes.draw do
  devise_for :users

  # pages not associated with a model
  root to: 'pages#home'
  get '/contact' => 'pages#contact'
  get '/plants' => 'pages#plants'

  # admin routes
  namespace :admin do
    root to: 'admin#dashboard'
    # resources :products
    resources :teas
  end

  resources :teas, only: [:index, :show]
end
