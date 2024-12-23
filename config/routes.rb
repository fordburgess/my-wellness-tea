Rails.application.routes.draw do
  root to: 'pages#home'

  resources :teas, only: [:index, :show]
end
