Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"

  root to: 'aggregates#dashboard'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #devise_scope :user do
  #  root to: "users/sessions#new"
  #end

  devise_for :users, controllers: {
      sessions: 'users/sessions',
      confirmations: 'users/confirmations',
  }
  resources :users
  resources :networks do
    resources :aggregates do
      member do
        post :switch_network
      end
    end
  end

end