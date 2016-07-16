Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :products, only: [:index, :show]
  resources :categories, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create] do
    resources :orders
  end

  root "products#index"
end
