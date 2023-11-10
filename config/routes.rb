Rails.application.routes.draw do
  root "proyects#index"
  devise_for :users
  resources :token_logins, only: %i[index new create]

  scope :dashboard do
    resources :proyects do
      resources :proyect_users
    end
  end
end
