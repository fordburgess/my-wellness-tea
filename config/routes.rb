Rails.application.routes.draw do
  get '/', to: redirect("/#{I18n.default_locale}")

  scope "/:locale", locale: /fr|de|it|en/ do
    get 'orders/index'
    get 'orders/show'
    get 'orders/new'
    get 'carts/show'
    devise_for :users

    # order and cart functionality
    get 'carts/:id' => "carts#show", as: "cart"
    delete 'carts/:id' => "carts#destroy"

    post 'line_items/:id/add' => "line_items#add_quantity", as: "line_item_add"
    post 'line_items/:id/reduce' => "line_items#reduce_quantity", as: "line_item_reduce"
    post 'line_items' => "line_items#create"
    get 'line_items/:id' => "line_items#show", as: "line_item"
    delete 'line_items/:id' => "line_items#destroy"

    resources :orders

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
end
