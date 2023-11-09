Rails.application.routes.draw do
  root "users#index"

  devise_for :users
  namespace :dashboard do
    resources :users
  end
end
