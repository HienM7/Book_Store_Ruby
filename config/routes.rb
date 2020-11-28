Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'books/shop'
  # resources :carts
  scope '/admin' do 
    resources :users
    resources :books
  end

  get 'carts/addtocart/:id', to: 'carts#addtocart', as: 'addtocart'
  get 'carts/removefromcart/:id', to: 'carts#removefromcart', as: 'removefromcart'
  get 'carts', to: 'carts#index'

  resources :orders 
  # resources :carts
  root to: 'pages#index'
end
