Rails.application.routes.draw do
  # mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :products, :users, :sessions, :categories, :admin

  root "products#index"
end
