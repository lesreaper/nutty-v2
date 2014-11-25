Nutty::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers
  resources :products, only: [:index, :show]
  resources :cart, only: [:index]
  resources :line_items, only: [:create, :update, :destroy]

	post 'cart/complete' => 'cart#complete'

  root 'products#index'
end
