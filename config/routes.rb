Rails.application.routes.draw do
  get '/', to: redirect("/#{I18n.default_locale}")

  resources :payments
  scope "/:locale", locale: /fr|de|it|en/ do

    get 'my-orders', to: 'orders#index', as: :my_orders
    resources :orders
    get 'carts/show'
    devise_for :users, controllers: {
      registrations: 'users/registrations'
    }

    resources :plants, only: [:index, :show]

    # order and cart functionality
    get 'carts/:id' => "carts#show", as: "cart"
    delete 'carts/:id' => "carts#destroy"

    # user orders
    get '/orders' => 'orders#index'

    post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
    post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
    post 'line_items' => "line_items#create"
    get 'line_items/:id' => "line_items#show", as: "line_item"
    delete 'line_items/:id' => "line_items#destroy"

    # pages not associated with a model
    root to: 'pages#home'
    get '/contact' => 'pages#contact'
    get '/terms-and-conditions' => 'pages#terms_and_conditions'
    get '/privacy-policy' => 'pages#privacy_policy'
    get '/our-brand' => 'pages#our_brand'

    # admin routes
    namespace :admin do
      root to: 'admin#dashboard'
      # resources :products
      resources :teas
      resources :plants
      resources :orders
      resources :users, only: [:index]
    end

    resources :teas, only: [:index, :show]
    resources :plants, only: [:index, :show]
    resources :orders
  end
end
