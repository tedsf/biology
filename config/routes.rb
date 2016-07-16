Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :products, :users, :sessions, :categories, :orders

  root "products#index"
end
