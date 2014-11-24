Nutty::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :customers
  resources :products, only: [:index, :show]

  root 'products#index'
end
