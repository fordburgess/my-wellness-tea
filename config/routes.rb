Rails.application.routes.draw do
  devise_for :users

  # pages not associated with a model
  root to: 'pages#home'
  get '/contact' => 'pages#contact'
  get '/plants' => 'pages#plants'

  resources :products, only: [:index, :show]
end
