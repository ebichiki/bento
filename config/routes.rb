Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :monthly_orders
  resources :order
  root 'monthly_orders#index'
  # put :order, to: 'order#update_all'
end
