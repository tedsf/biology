Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories, only: [:show]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create] do
    resources :orders
  end
  resources :products, only: [:index, :show]do
    resources :ratings
  end

  root "products#index"
end
