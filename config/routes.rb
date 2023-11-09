Rails.application.routes.draw do
  root "users#index"
  devise_for :users
  resources :token_logins, only: %i[index new create]

  scope :dashboard do
    resources :users
  end
end
