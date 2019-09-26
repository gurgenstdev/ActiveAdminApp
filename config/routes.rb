Rails.application.routes.draw do
  default_url_options :host => "localhost:3000"

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users , controllers: {
      sessions: 'users/sessions',
      confirmations: 'users/confirmations',
  }

  resources :users
end
