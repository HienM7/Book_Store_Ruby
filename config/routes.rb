Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope '/admin' do 
    root to: 'users#index', :as => :root_with_locale
    resources :users
  end
  root to: 'pages#index'
end
